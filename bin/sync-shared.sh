#!/bin/bash

declare bindir
bindir="$(realpath "$(dirname "$0")")"
cd "$bindir" || exit 1

while read -r dest; do
    echo "Syncing $dest..."
    rsync \
        --recursive \
        --links \
        --perms \
        --group \
        --checksum \
        --out-format='%i %n' \
        ../shared/ "$dest"
done < <(find ../ -maxdepth 3 -type d -path '../exercises/practice/*')
