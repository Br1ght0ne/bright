EAPI=7

inherit cmake-utils

SRC_URI="https://github.com/octobanana/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="A responsive and customizable clock, timer, and stopwatch for the terminal"
HOMEPAGE="https://octobanana.com/software/peaclock"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	>=sys-devel/gcc-8.2.0[cxx,nptl]
	>=dev-util/cmake-3.8
	>=dev-libs/icu-62.1
"

DOCS="help.txt README.md"
