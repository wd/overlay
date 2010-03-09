# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

#inherit versionator
#MY_P=${PN}-$(delete_version_separator 2)
#S=${WORKDIR}/${MY_P}
MODULE_AUTHOR=AGENT
inherit perl-module

DESCRIPTION="Cluster operations based on parallel SSH, set and interval arithmetic"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="dev-perl/IPC-Run3
		>=dev-perl/set-scalar-1.23
		dev-perl/File-HomeDir
		perl-core/File-Temp
		dev-perl/TermReadKey"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build"

SRC_TEST="do"
