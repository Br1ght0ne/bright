# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Terminal based replica of the digital rain from The Matrix"
HOMEPAGE="https://github.com/M4444/TMatrix"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="${HOMEPAGE}.git"
	inherit git-r3
else
	SRC_URI="${HOMEPAGE}/releases/download/v${PV}/installation.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"

DEPEND="
	sys-libs/ncurses:5[unicode]
"

DOCS="README.md LICENSE CONTRIBUTING.md"

src_install() {
	doman "${PN}.6"
	cmake-utils_src_install
}
