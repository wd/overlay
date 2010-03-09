# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

KMNAME="kdereview"
KMMODULE="plasma/applets/kimpanel"

EAPI="2"
inherit kde4-base

DESCRIPTION="kimpanel is a input method frontend, support ibus fcitx adn scim as backend"
HOMEPAGE="http://userbase.kde.org/Tutorials/Kimpanel_%28zh_CN%29"
#ESVN_REPO_URI="http://anonsvn.kde.org/home/kde/trunk/kdereview/plasma/applets/kimpanel"
#ESVN_PROJECT="kimpanel"

LICENSE="GPL-2"
SLOT="4"
IUSE="+scim ibus"
KEYWORDS="~x86"

RDEPEND="kde-base/plasma-runtime
	scim? ( app-i18n/scim )
	ibus? ( app-i18n/ibus )"

DEPEND="${RDEPEND}"

pkg_setup() {
	if ! use scim && ! use ibus; then
		eerror "You need to pick up one of the backend implementations"
		eerror "   * scim"
		eerror "   * fcitx(not support by this ebuild)"
		eerror "   * ibus"
		die "No backend selected"
	fi
	kde4-base_pkg_setup
}

src_prepare() {
	if ! use scim; then
		sed -i '/macro_optional_add_subdirectory(scim)/d' ${S}/backend/CMakeLists.txt || die "disable scim failed"
	fi
	
	kde4-base_src_prepare
}

src_install() {
	if use ibus; then
		cd ${S}/backend/ibus
		exeinto /usr/share/kimpanel/
		doexe panel.py
		insinto /usr/share/kimpanel/
		doins qtpanel.xml
	fi
	kde4-base_src_install
}

pkg_postinst() {
	kde4-base_pkg_postinst
	if use ibus; then
		einfo "Start ibus with:"
		einfo "  ibus-daemon --panel=/usr/share/kimpanel/panel.py";
	fi
}
