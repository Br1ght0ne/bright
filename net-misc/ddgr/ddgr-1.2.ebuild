# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit eutils python-r1 bash-completion-r1

DESCRIPTION="DuckDuckGo from the terminal"
HOMEPAGE="https://github.com/jarun/ddgr"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion fish-completion zsh-completion"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"


src_prepare(){
	sed -i "s#/usr/local#/usr#" Makefile
	default
}

src_install(){
	emake DESTDIR="${D}" install
	use bash-completion && newbashcomp auto-completion/bash/${PN}-completion.bash ${PN}
	if use fish-completion; then
		insinto /usr/share/fish/vendor_completions.d/
		doins auto-completion/fish/${PN}.fish
	fi
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins auto-completion/zsh/_${PN}
	fi

}
