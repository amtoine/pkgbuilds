# Maintainer: Antoine Stevan
pkgname=a2n-s-icons
pkgver=5.0.r4.f601c5e
pkgrel=1
epoch=
pkgdesc="My personal collection of icons."
arch=(x86_64)
url="https://github.com/a2n-s/icons.git"
license=('GNU')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd icons
    mkdir -p ${pkgdir}/usr/share/icons/${pkgname}
    cp -rf icons/* ${pkgdir}/usr/share/icons/${pkgname}
}
