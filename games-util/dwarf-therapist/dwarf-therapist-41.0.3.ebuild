# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Dwarf (The)rapist for Dwarf Fortress."
HOMEPAGE="https://github.com/Dwarf-Therapist/Dwarf-Therapist"

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

DOCS="README.rst CHANGELOG.txt LICENSE.txt"

S="${WORKDIR}/Dwarf-Therapist-${PV}"

DEPEND="
	dev-util/cmake
"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
"
