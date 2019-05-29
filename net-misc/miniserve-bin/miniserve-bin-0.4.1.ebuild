# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A CLI tool to serve files and dirs over HTTP"
HOMEPAGE="https://github.com/svenstaro/${PN%-bin}"

SRC_URI="${HOMEPAGE}/releases/download/v${PV}/${PN%-bin}-linux-x86_64 -> ${P}"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

QA_PRESTRIPPED="usr/bin/${PN%-bin}"
QA_PREBUILT="usr/bin/${PN%-bin}"

S="${WORKDIR}"

src_unpack() { :; }

src_install() {
	newbin "${DISTDIR}/${P}" ${PN%-bin}
}
