# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="SCWS is a chinese tokenizer"
HOMEPAGE="https://github.com/hightman/scws"
SRC_URI="http://www.xunsearch.com/scws/down/${P}.tar.bz2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}"

src_configure() {
	econf --sysconfdir=/etc/scws
}

src_install() {
    emake DESTDIR="${D}" install || die "make install failed"
}

