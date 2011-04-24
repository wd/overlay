# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

#inherit versionator
#MY_P=${PN}-$(delete_version_separator 2)
#S=${WORKDIR}/${MY_P}
MODULE_AUTHOR=RKRIMEN
inherit perl-module eutils

DESCRIPTION="Jemplate - JavaScript Templating with Template Toolkit"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="dev-perl/Template-Toolkit"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build
	dev-perl/File-Find-Rule"

SRC_TEST="do"

src_prepare() {
	epatch "${FILESDIR}/morefilters.patch"
	perl-module_src_prepare
}
