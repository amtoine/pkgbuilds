#! /usr/bin/env nu

let path = "x86_64"
let  versions_file = "VERSIONS.md"

let header = "## The packages and their versions"


def gen-table [] {
    grep "pkgver=" -r $path |
        lines |
        str replace $"($path)/" "[" |
        str replace "/PKGBUILD" "]" |
        split column ":pkgver=" |
        rename name version |
        sort-by name |
        to md --pretty |
        save --force --append $versions_file
}


def gen-links [] {
    ls $path |
        insert url {
            |it|
            let pkg = ($it.name  | str replace $"($path)/" "")
            $"[($pkg)]: https://github.com/amtoine/pkgbuilds/blob/main/($path)/($pkg)/PKGBUILD"
        } |
        select url |
        to csv -n |
        save --force --append $versions_file
}


def main [] {
    echo $header | save --force $versions_file
    echo "\n" | save --append $versions_file
    echo "\n" | save --append $versions_file
    gen-table
    echo "\n" | save --append $versions_file
    echo "\n" | save --append $versions_file
    gen-links
}
