#!/bin/bash

declare bindir
bindir=$(realpath "$(dirname "$0")")
cd "${bindir%/*}" || exit 1

declare makefile=''
read -r -d $'\0' makefile  << 'END_OF_MAKEFILE'
SHELL      = /bin/bash
BASENAME   = $(shell basename "$$PWD" | sed -r 's/(^|-)([a-z])/\U\2/g')
TESTFILE   = $(BASENAME)Tests.pas
EXECUTABLE = $(BASENAME)Tests
COMMAND    = fpc -l- -v0 -Sehnw -Fu./lib "./$(TESTFILE)"
test:
        @#cp ./.meta/example.pas $(BASENAME).pas
        @$(COMMAND) && "./$(EXECUTABLE)"
END_OF_MAKEFILE

rm -fr build
mkdir -p build || exit 1
cp -r exercises/practice/* build/ || exit 1

for path in build/*; do
    pushd "$path" > /dev/null || exit 1
    echo "$makefile" > Makefile
    makeout=$(make 2>&1 | sed -e '1{/^1\.\.[0-9]\+$/d}' -e '/^ok [0-9]/d')
    echo -n "exercise: $(basename "$path") = "
    if [[ "$makeout" == '' ]]; then
        echo 'pass'
    else
        echo 'fail'
        echo "$makeout"
        echo ''
    fi
    popd > /dev/null || exit 1
done

rm -fr build
