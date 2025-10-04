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
\t@jq -M -r '.authors | length | if . < 1 then ( "[ERROR] authors not set\n" | halt_error) end' ./.meta/config.json > /dev/null
\t@cp ./.meta/example.pas $(BASENAME).pas
\t@$(COMMAND) && "./$(EXECUTABLE)"
END_OF_MAKEFILE
declare -r tab=$'\t'
makefile="${makefile//\\t/$tab}"

declare -i fails
fails=0

rm -fr build
mkdir -p build || exit 1
cp -r exercises/practice/* build/ || exit 1

for path in build/*; do
    pushd "$path" > /dev/null || exit 1
    echo "$makefile" > Makefile
    makeout=$(make 2>&1 | sed -e '1{/^1\.\.[0-9]\+$/d}' -e '/^ok [0-9]/d')
    echo -n "[EXERCISE] $(basename "$path")... "
    if [[ "$makeout" == '' ]]; then
        echo 'pass'
    else
        echo 'fail'
        echo "$makeout"
        echo ''
        let 'fails += 1'
    fi
    popd > /dev/null || exit 1
done

rm -fr build

test $fails -eq 0 || exit 1
