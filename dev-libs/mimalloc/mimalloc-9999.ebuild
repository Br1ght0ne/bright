# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils multilib

DESCRIPTION="A compact general purpose allocator with excellent performance"
HOMEPAGE="https://github.com/microsoft/mimalloc"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="${HOMEPAGE}.git"
	inherit git-r3
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-util/cmake
"

DOCS="LICENSE readme.md"

src_prepare() {
	eapply_user

	elog "Patching libdir to $(get_libdir)"
	sed -i -e "s/set(mi_install_dir \"lib/set(mi_install_dir \"$(get_libdir)/" CMakeLists.txt || die "Patching libdir failed!"
	sed -i -e "s/DESTINATION lib/DESTINATION $(get_libdir)/" CMakeLists.txt || die "Patching libdir failed!"

	cmake-utils_src_prepare
}
