# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit subversion

DESCRIPTION="GeMan X is a branch of PCMan X."
HOMEPAGE="http://code.google.com/p/gemanx/"
ESVN_REPO_URI="http://gemanx.googlecode.com/svn/trunk/"
ESVN_PROJECT="gemanx"


LICENSE="GPL-2"
SLOT="0"
IUSE="firefox libnotify socks5"
KEYWORDS="~x86"

RDEPEND=">=x11-libs/gtk+-2.4
	x11-libs/libXft
	dev-util/intltool
	firefox? ( www-client/mozilla-firefox )
	libnotify? ( x11-libs/libnotify )"

DEPEND="${RDEPEND}"


ESVN_BOOTSTRAP='autogen.sh'
ESVN_PATCHES="${FILES}/no_url_red_line.patch
			${FILES}/close-to-tray.patch"

src_configure () {
	local myconf="$(use_enable firefox plugin) \
				  $(use_enable socks5 proxy) \
				  $(use_enable libnotify)
				  --enable-imageview
				  --enable-iplookup"
	econf $myconf || die "econf failed"	
}

src_install () {
	emake DESTDIR="${D}" install || die "Install failed"
}
