# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Script to integrate rofi and pass"
HOMEPAGE="https://github.com/carnager/rofi-pass"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="otp"

DEPEND=""
RDEPEND="
	app-admin/pass
	x11-misc/rofi
	sys-apps/sed
	x11-misc/xdotool
	sys-apps/gawk
	>=app-shells/bash-4.0_p44
	app-admin/pwgen
	otp? ( app-admin/pass-otp )
	${DEPEND}
"

src_compile() {
	emake DESTDIR="${D}" install
}
