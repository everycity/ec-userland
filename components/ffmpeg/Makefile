#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 Audioboo Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ffmpeg
COMPONENT_VERSION=	0.6.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:24ada1d35fc000980090e773101e101ca45f85e5
COMPONENT_ARCHIVE_URL=	http://www.ffmpeg.org/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include configure.mk
include ../../make-rules/ips.mk

include ../../make-rules/shared-targets.mk

CONFIGURE_OPTIONS += --disable-static --enable-shared --enable-libfaac --enable-libgsm --enable-libspeex --enable-libvorbis --enable-nonfree --disable-ffplay --disable-avdevice --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-version3 --host-libs=/ec/lib

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

