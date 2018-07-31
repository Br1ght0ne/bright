# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{3_4,3_5,3_6,3_7} )
inherit distutils-r1

DESCRIPTION="Manage dotfiles with stow"
HOMEPAGE="https://github.com/codejamninja/dotstow"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/python-3.4.5-r1"
RDEPEND="${DEPEND}
app-admin/stow
dev-vcs/git
"
