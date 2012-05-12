# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-i18n/ibus-qt/ibus-qt-1.3.1.ebuild,v 1.4 2012/05/03 19:24:31 jdhore Exp $

EAPI="2"
#inherit make-utils eutils
inherit eutils

DESCRIPTION="Rime Input Method Engine library"
HOMEPAGE="http://code.google.com/p/rimeime/"
SRC_URI="http://rimeime.googlecode.com/files/${P}.tar.gz"
EPATCH_SOURCE="${FILESDIR}/page_size.patch"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND=">=app-i18n/ibus-1.3.7
	>=sys-apps/dbus-1.2
	x11-libs/libX11
	dev-libs/boost
	dev-cpp/gtest
	dev-db/kyotocabinet
	app-i18n/opencc
	dev-cpp/yaml-cpp"
DEPEND="${RDEPEND}
	dev-util/cmake"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	cd "${S}/librime"
	epatch ${FILESDIR}/page_size.patch || die 'patch failed'
}

src_compile() {
	cd "${S}/librime"
	emake || die "emake failed"
}

src_install() {
	cd "${S}/librime"
    emake DESTDIR="${D}" install || die "Install failed"
}
