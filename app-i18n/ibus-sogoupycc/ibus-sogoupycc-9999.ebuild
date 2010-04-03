# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit subversion

DESCRIPTION="ibus-sogoupycc is a Sogou cloud client, a Chinese input method on ibus platform."
HOMEPAGE="http://ibus-sogoupycc.googlecode.com/"
ESVN_REPO_URI="http://ibus-sogoupycc.googlecode.com/svn/trunk/"
ESVN_PROJECT="ibus-sogoupycc"


LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~x86"

RDEPEND=">=app-i18n/ibus-1.3.0
        >=dev-lang/lua-5.1
        dev-libs/luasocket
        dev-db/sqlite:3
        x11-libs/gtk+:2
        x11-libs/libnotify"

DEPEND="${RDEPEND}"

ESVN_BOOTSTRAP='linux/build.sh'

src_install () {
	cd ${S}/linux/build
	emake DESTDIR="${D}" install || die "Install failed"
}
