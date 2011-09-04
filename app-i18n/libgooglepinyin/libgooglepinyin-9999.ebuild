# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils mercurial

EHG_REPO_URI="https://libgooglepinyin.googlecode.com/hg/"
EHG_REVISION="default"

DESCRIPTION="A fork from google pinyin on android"
HOMEPAGE="http://libgooglepinyin.googlecode.com"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="opencc"
RESTRICT="mirror"

RDEPEND="app-i18n/ibus
		opencc? ( app-i18n/opencc )
		"
DEPEND="${RDEPEND}"
