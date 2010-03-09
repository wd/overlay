# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit rpm

DESCRIPTION="PPlive is a p2p film player"
HOMEPAGE="http://pplive.com http://forum.ubuntu.org.cn/viewtopic.php?f=73&t=219084"
SRC_URI="http://apt.compal.com/aigo/update/${P}-3.i386.rpm"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /etc
	doins etc/ppllist.xml

	exeinto /usr/bin
	doexe usr/bin/*

	insinto /usr/share/pixmaps
	doins -r usr/share/pixmaps/pplive

	insinto usr/share/locale/zh_CN/LC_MESSAGES
	doins usr/share/locale/zh_CN/LC_MESSAGES/pplive.mo

	insinto usr/share/themes
	doins -r usr/share/themes/default
}
