# Copyright 2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools readme.gentoo-r1

DESCRIPTION="Standalone scrobbler for the C* Music Player"
HOMEPAGE="https://github.com/Arkq/${PN}"

LICENSE="GPL-3"
SLOT="0"
IUSE="libnotify"

if [[ ${PV} == *9999 ]] ; then
	inherit	git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

CDEPEND="net-misc/curl
	dev-libs/openssl:0=
	libnotify? ( >=x11-libs/libnotify-0.7 )"
DEPEND="${CDEPEND}
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	media-sound/cmus"

src_prepare() {
	default
	eautoreconf
	DOC_CONTENTS="Please refer to the README.md file before running cmusfm the first time."
}

src_configure() {
	econf $(use_enable libnotify)
}

src_install() {
	default
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_pkg_postinst
}
