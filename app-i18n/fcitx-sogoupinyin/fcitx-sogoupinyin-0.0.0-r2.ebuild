# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-i18n/fcitx-cloudpinyin/fcitx-cloudpinyin-0.3.1.ebuild,v 1.1 2013/01/31 09:06:37 yngwin Exp $

EAPI=5

DESCRIPTION="A fcitx module by SoGou Inc."
HOMEPAGE="http://pinyin.sogou.com/"
SRC_URI="x86? ( ${PN}_${PV}-2_i386.deb )
         amd64? ( ${PN}_${PV}-2_amd64.deb )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-i18n/fcitx"
DEPEND="${RDEPEND}
	app-arch/dpkg
	virtual/pkgconfig"

RESTRICT="fetch"

pkg_nofetch() {
      einfo "Please visit ${HOMEPAGE}"
      einfo "and place ${A} in ${DISTDIR}"
}

src_unpack() {
      # self unpacking zip archive; unzip warns about the exe stuff
	  mkdir ${P}
      dpkg-deb --fsys-tarfile ${DISTDIR}/${A} | tar xvf - -C ${P}
}

src_prepare() {
	  use amd64 && mv usr/lib/x86_64-linux-gnu/fcitx/ usr/lib/ && rm -r usr/lib/x86_64-linux-gnu/
	  use x86 && mv usr/lib/i386-linux-gnu/fcitx/ usr/lib/ && rm -r usr/lib/i386-linux-gnu/
}

src_install() {
      # Install files
      #dodir /usr/lib/fcitx/
      cp -R ${S}/* ${D}/ || die "install to ${D} failed"
}

