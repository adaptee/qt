# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit cmake-utils

DESCRIPTION="Razor-qt session manager"
HOMEPAGE="http://razor-qt.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/Razor-qt/razor-qt.git"
	EGIT_BRANCH="master"
	KEYWORDS=""
else
	SRC_URI="https://github.com/downloads/Razor-qt/razor-qt/razorqt-${PV}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="LGPL-2.1+"
SLOT="0"
IUSE=""

DEPEND="razorqt-base/razorqt-libs"
RDEPEND="${DEPEND}
	razorqt-base/razorqt-data
	|| ( x11-wm/openbox
		kde-base/kwin
		x11-wm/metacity
		xfce-base/xfwm4
		x11-wm/enlightenment
		x11-wm/fvwm
		x11-wm/sawfish
		x11-wm/windowmaker
	)"

src_configure() {
	local mycmakeargs=(
		-DSPLIT_BUILD=On
		-DMODULE_SESSION=On
		-DBUNDLE_XDG_UTILS=No
	)
	cmake-utils_src_configure
}
