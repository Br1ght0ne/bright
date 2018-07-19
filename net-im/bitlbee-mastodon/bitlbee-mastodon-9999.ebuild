# Copyright 2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A Mastodon plugin for BitlBee"
HOMEPAGE="https://wiki.bitlbee.org/HowToMastodon"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

if [[ ${PV} == *9999 ]] ; then
	inherit	git-r3
	EGIT_REPO_URI="https://github.com/kensanata/${PN}"
else
	SRC_URI="https://github.com/kensanata/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RDEPEND="
	>=dev-libs/glib-2.32
	dev-libs/json-glib
	>=net-im/bitlbee-3.5[plugins]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
