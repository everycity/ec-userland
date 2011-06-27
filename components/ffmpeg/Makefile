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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ffmpeg
COMPONENT_VERSION=	0.8
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:461f87c4fc080e10ac0acc48287aaa706021bbc4
COMPONENT_ARCHIVE_URL=	http://www.ffmpeg.org/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS=	--prefix=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--mandir=$(ECPREFIX)/share/man
CONFIGURE_OPTIONS.32=	--bindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64=	--bindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32+=	--libdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS.64+=	--libdir=$(ECPREFIX)/lib/$(MACH64)
CONFIGURE_OPTIONS.32+=	--shlibdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS.64+=	--shlibdir=$(ECPREFIX)/lib/$(MACH64)
CONFIGURE_OPTIONS.32+=	--cpu=i686

CONFIGURE_OPTIONS+=	--cc="$(CC)"
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--enable-nonfree
CONFIGURE_OPTIONS+=	--enable-version3
CONFIGURE_OPTIONS+=	--enable-gpl
CONFIGURE_OPTIONS+=	--enable-libfaac
CONFIGURE_OPTIONS+=	--enable-libdirac
CONFIGURE_OPTIONS+=	--enable-libopenjpeg
CONFIGURE_OPTIONS+=	--enable-libschroedinger
CONFIGURE_OPTIONS+=	--enable-libx264
CONFIGURE_OPTIONS+=	--enable-libxvid
CONFIGURE_OPTIONS+=	--enable-libgsm
CONFIGURE_OPTIONS+=	--enable-libspeex
CONFIGURE_OPTIONS+=	--enable-libvorbis
CONFIGURE_OPTIONS+=	--enable-libmp3lame
CONFIGURE_OPTIONS+=	--enable-libtheora
CONFIGURE_OPTIONS+=	--enable-libopencore-amrnb
CONFIGURE_OPTIONS+=	--enable-libopencore-amrwb
CONFIGURE_OPTIONS+=	--disable-ffplay
CONFIGURE_OPTIONS+=	--disable-avdevice

CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	\
	/bin/echo "\#define FFMPEG_VERSION \"$(COMPONENT_VERSION)\"" > $(SOURCE_DIR)/version.h

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

