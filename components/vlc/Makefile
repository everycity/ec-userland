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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		vlc
COMPONENT_VERSION=	1.1.11
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:068e75bdbfe6e595a4db14ad49e05688c8b1d5ad
COMPONENT_ARCHIVE_URL=	http://sourceforge.net/projects/$(COMPONENT_NAME)/files/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)/download

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk
include ../../make-rules/gnu-ld.mk

VLCFLAGS = 	-D _XPG4_2 -D __SunOS -D __STDC_ISO_10646__ -D __EXTENSIONS__ -I$(ECPREFIX)/include -I$(ECPREFIX)/include/ncurses
CFLAGS +=	$(VLCFLAGS)
LDFLAGS	+=	-lnsl

CONFIGURE_ENV +=	CXXFLAGS="$(VLCFLAGS)"

CONFIGURE_OPTIONS+=	--with-pic --enable-shared --disable-static
CONFIGURE_OPTIONS+=	--disable-libgcrypt
CONFIGURE_OPTIONS+=	--disable-remoteosd
CONFIGURE_OPTIONS+=	--disable-glx
CONFIGURE_OPTIONS+=	--disable-lua
CONFIGURE_OPTIONS+=	--disable-a52
CONFIGURE_OPTIONS+=	--disable-sdl
CONFIGURE_OPTIONS+=	--enable-qt4
CONFIGURE_OPTIONS+=	--enable-debug
CONFIGURE_OPTIONS+=	--enable-dvbpsi
CONFIGURE_OPTIONS+=	--enable-libmpeg2
CONFIGURE_OPTIONS+=	--enable-live555
CONFIGURE_OPTIONS+=	--enable-caca
CONFIGURE_OPTIONS+=	--enable-ncurses
CONFIGURE_OPTIONS+=	--enable-run-as-root
CONFIGURE_OPTIONS+=	--enable-id3tag
CONFIGURE_OPTIONS+=	--enable-faad
CONFIGURE_OPTIONS+=	--with-live555-tree=$(ECPREFIX)/lib/live555-$(BITS)bit

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

