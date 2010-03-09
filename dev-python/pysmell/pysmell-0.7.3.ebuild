# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/beautifulsoup/beautifulsoup-3.0.7.ebuild,v 1.4 2009/04/27 19:28:36 maekke Exp $

NEED_PYTHON="2.5"

inherit distutils

DESCRIPTION="PySmell is a python IDE completion helper."
HOMEPAGE="http://code.google.com/p/pysmell"
SRC_URI="http://pypi.python.org/packages/source/p/pysmell/${PF}.zip"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 ~x86 ~x86-fbsd"
IUSE=""

#src_test() {
#	PYTHONPATH="." "${python}"  || die "tests failed"
#}
