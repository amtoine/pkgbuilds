#!/usr/bin/env bash
# TODO.

echo "$0"

full_path=$(realpath "$0")
dir_path=${full_path%/*}

find "$dir_path/x86_64" -mindepth 2 -maxdepth 2 -type d | xargs -I {} rm -rfv {}
find "$dir_path/x86_64" -maxdepth 2 -type f -not -name PKGBUILD -not -name "*.install" | xargs -I {} rm -vf {}
echo "$dir_path is now clean!"
