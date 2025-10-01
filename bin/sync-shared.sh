#!/bin/bash

declare bindir
bindir="$(realpath "$(dirname "$0")")"
cd "$bindir" || exit 1

while read -r dest; do
    echo "Syncing $dest..."
    rsync --archive --out-format='%i %n' ../shared/ "$dest" |
        awk '!(NR==1&&$0=".d..t...... ./")'
done < <(find ../ -maxdepth 3 -type d -path '../exercises/practice/*')
