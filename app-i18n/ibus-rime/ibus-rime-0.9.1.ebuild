# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-i18n/ibus-qt/ibus-qt-1.3.1.ebuild,v 1.4 2012/05/03 19:24:31 jdhore Exp $

EAPI="2"
#inherit make-utils eutils

DESCRIPTION="Rime Input Method Engine library"
HOMEPAGE="http://code.google.com/p/rimeime/"
SRC_URI="http://rimeime.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND=">=app-i18n/ibus-1.3.7
	>=sys-apps/dbus-1.2
	app-i18n/librime
	dev-cpp/yaml-cpp"
DEPEND="${RDEPEND}
	dev-util/cmake"

S="${WORKDIR}/${MY_P}"

src_compile() {
	cd "${S}/ibus-rime"
	emake || die "emake failed"
}

src_install() {
	cd "${S}/ibus-rime"
    emake DESTDIR="${D}" install || die "Install failed"
}
