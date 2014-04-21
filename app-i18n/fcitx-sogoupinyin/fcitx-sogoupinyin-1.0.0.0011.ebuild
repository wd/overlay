# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Fcitx Wrapper for sogoupinyin."
HOMEPAGE="http://code.google.com/p/fcitx"
SRC_URI="amd64? (
http://download.ime.sogou.com/1397738329/sogou_pinyin_linux_${PV}_amd64.deb -> ${P}_amd64.deb )
x86? ( http://download.ime.sogou.com/1397738329/sogou_pinyin_linux_${PV}_i386.deb -> ${P}_i386.deb )"

LICENSE="Fcitx-Sogou"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="mirror"

RDEPEND=">=app-i18n/fcitx-4.2.6"
DEPEND="${RDEPEND}"
S=${WORKDIR}

src_configure(){
	#unpack "
	#	x86? ( arch/data.i386.tar.xz )
	#	amd64? ( arch/data.amd64.tar.xz )"
	echo "Current Directory"
	pwd
	unpack ${A}
    unpack ./data.tar.xz
}

src_install(){
	dodir /usr/bin
	insinto /usr/bin
	insopts -m0755
	doins ${S}/usr/bin/*

	dodir /usr/lib/fcitx
	insinto /usr/lib/fcitx
	insopts -m0755
	doins ${S}/usr/lib/*-linux-gnu/fcitx/*

	insinto /usr/share
	insopts -m0644
	doins -r ${S}/usr/share/sogoupinyin
	doins -r ${S}/usr/share/fcitx
	doins -r ${S}/usr/share/icons
	doins -r ${S}/usr/share/locale
	doins -r ${S}/usr/share/fcitx-qimpanel
	doins -r ${S}/usr/share/fcitx-sogoupinyin
	doins -r ${S}/usr/share/icons
	doins -r ${S}/usr/share/locale
	doins -r ${S}/usr/share/mime
	doins -r ${S}/usr/share/pixmaps
	doins -r ${S}/usr/share/sogoupinyin
}

pkg_postinst(){
	einfo
	einfo "After install the fcitx-sogoupinyin, a restart of fcitx is"
	einfo "expected."
	einfo
	einfo "If you could not find Sogoupinyin in the Fcitx Input Method"
	einfo "choice box, you may need to remove your configure file of"
	einfo "fcitx-cloudpinyin, which locate in ~/.config/fcitx/addon and"
	einfo "~/.config/fcitx/conf."
	einfo
	einfo "Add # before DelayStart settings at ~/.config/fcitx/config, "
	einfo "and add configure at ~/.xprofile bellow:"
	einfo
	einfo 'export XMODIFIERS="@im=fcitx"'
	einfo 'export XIM=fcitx'
	einfo 'export XIM_PROGRAM=fcitx'
	einfo 'export GTK_IM_MODULE="fcitx"'
	einfo 'export QT_IM_MODULE="fcitx"'
	einfo
	einfo 'fcitx'
	einfo 'fcitx-qimpanel'
	einfo
}
