#!/usr/bin/env bash
# TODO.

set -euo pipefail

echo "$0"

if [ "$#" -eq "0" ]; then
    search_paths=("x86_64/")
else
    search_paths=("$@")
fi

full_path=$(realpath "$0")
dir_path=${full_path%/*}

readarray -t x86_pkgbuilds <<< "$(find "${search_paths[@]}" -type f -name PKGBUILD | awk -F/ '{print $2}')"
for pkgbuild in "${x86_pkgbuilds[@]}"
do
    (
        cd "${dir_path}/x86_64/${pkgbuild}" || return
        echo "### Making ${dir_path}/x86_64/${pkgbuild} ###"
        makepkg --printsrcinfo > .SRCINFO
        makepkg -cf
    )
done
sudo pacman -U $(/usr/bin/find . -type f -name "*.pkg.tar.zst")
