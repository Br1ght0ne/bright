# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils bash-completion-r1

DESCRIPTION="Tasksh is a shell command that wraps Taskwarrior commands"
HOMEPAGE="https://gothenburgbitfactory.org/projects/tasksh.html"
SRC_URI="https://taskwarrior.org/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~x64-macos"

RDEPEND="
	app-misc/task
"

DOCS="AUTHORS ChangeLog COPYING INSTALL NEWS"

src_install() {
	cmake-utils_src_install

	newman doc/man/${PN}.1.in ${PN}.1
}
