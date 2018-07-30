# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="GNU/Linux application to control backlights"
HOMEPAGE="https://github.com/haikarainen/light"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="
	doc? ( sys-apps/help2man )
"
RDEPEND="${DEPEND}"

src_compile() {
	emake DESTDIR="${D}" light
	if use doc; then
		emake DESTDIR="${D}" man
	fi
}
