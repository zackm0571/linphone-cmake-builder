############################################################################
# config-desktop-raspberry.cmake
# Copyright (C) 2016  Belledonne Communications, Grenoble France
#
############################################################################
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#
############################################################################

get_filename_component(COMPILER_NAME ${CMAKE_C_COMPILER} NAME)
string(REGEX REPLACE "-gcc$" "" LINPHONE_BUILDER_HOST ${COMPILER_NAME})
unset(COMPILER_NAME)

set(LINPHONE_BUILDER_PKG_CONFIG_PATH "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/:${SYSROOT_PATH}/usr/lib/pkgconfig")

include("configs/config-desktop.cmake")

set(DEFAULT_VALUE_ENABLE_WASAPI OFF)

# ffmpeg
set(EP_ffmpeg_CROSS_COMPILATION_OPTIONS
	"--prefix=${CMAKE_INSTALL_PREFIX}"
	"--enable-cross-compile"
	"--cross-prefix=arm-linux-gnueabihf-"
	"--arch=arm"
	"--target-os=linux"
)

# linphone
linphone_builder_add_cmake_option(linphone "-DENABLE_GTK_UI=NO")

# opus
linphone_builder_add_cmake_option(opus "-DENABLE_FIXED_POINT=YES")

# vpx
set(EP_vpx_CROSS_COMPILATION_OPTIONS
	"--prefix=${CMAKE_INSTALL_PREFIX}"
	"--target=armv6-linux-gcc"
)

