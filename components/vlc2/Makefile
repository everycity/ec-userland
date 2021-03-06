#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL)". You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2014 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		vlc
COMPONENT_FMRI=		multimedia/vlc
COMPONENT_VERSION=	2.1.5
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	http://www.videolan.org/vlc/
COMPONENT_SUMMARY=	VLC Cross-platform Multimedia Player and Framework
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:6f6566ab6cd90d381395b7f0e401060b044cd3843e50ceb252b558a88e5d1f72
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_VIDEOLAN)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PKG_CONFIG_PATH.32 = $(ECPREFIX)/lib/pkgconfig
PKG_CONFIG_PATH.64 = $(ECPREFIX)/lib/$(MACH64)/pkgconfig
PKG_CONFIG_PATH = $(PKG_CONFIG_PATH.$(BITS))
PKG_CONFIG.32 = $(ECPREFIX)/bin/pkg-config
PKG_CONFIG.64 = $(ECPREFIX)/bin/$(MACH64)/pkg-config
PKG_CONFIG = $(PKG_CONFIG.$(BITS))

LDFLAGS.32+=	-L$(ECPREFIX)/lib -R$(ECPREFIX)/lib -L$(ECPREFIX)/lib/qt/4.7/lib -R$(ECPREFIX)/lib/qt/4.7/lib
LDFLAGS.64+=	-L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64) -L$(ECPREFIX)/lib/qt/4.7/lib/$(MACH64) -R$(ECPREFIX)/lib/qt/4.7/lib/$(MACH64)
LDFLAGS+=	-lnsl
CFLAGS+=	-D _XPG4_2 -D __SunOS -D __STDC_ISO_10646__ -D __EXTENSIONS__ -D __EC_SOLARIS_$(subst .,_,$(SOLARIS_VERSION)) -I$(ECPREFIX)/include -I$(ECPREFIX)/include/ncurses
CXXFLAGS+=	$(CFLAGS)

COMPONENT_BUILD_ENV+=	CFLAGS="$(CFLAGS)"
COMPONENT_BUILD_ENV+=	CXXFLAGS="$(CXXFLAGS)"
COMPONENT_BUILD_ENV+=	LDFLAGS="$(LDFLAGS)"

CONFIGURE_OPTIONS+=	--with-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--disable-debug
CONFIGURE_OPTIONS+=	--disable-libgcrypt
CONFIGURE_OPTIONS+=	--disable-glx
CONFIGURE_OPTIONS+=	--disable-lua
CONFIGURE_OPTIONS+=	--disable-a52
CONFIGURE_OPTIONS+=	--disable-sdl
CONFIGURE_OPTIONS+=	--disable-oss
CONFIGURE_OPTIONS+=	--enable-avcodec
CONFIGURE_OPTIONS+=	--enable-avformat
CONFIGURE_OPTIONS+=	--enable-x264
CONFIGURE_OPTIONS+=	--enable-sout
CONFIGURE_OPTIONS+=	--enable-dvbpsi
CONFIGURE_OPTIONS+=	--enable-libmpeg2
CONFIGURE_OPTIONS+=	--enable-live555
CONFIGURE_OPTIONS+=	--enable-caca
CONFIGURE_OPTIONS+=	--enable-ncurses
CONFIGURE_OPTIONS+=	--enable-run-as-root
CONFIGURE_OPTIONS+=	--enable-faad
CONFIGURE_OPTIONS+=	--with-contrib=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--disable-silent-rules
CONFIGURE_OPTIONS+=	LIVE555_PREFIX=$(ECPREFIX)

# Inline assembly optimisations are broken on 32bit (gcc segfault)
CONFIGURE_OPTIONS.32+=	--disable-mmx
CONFIGURE_OPTIONS.32+=	--disable-sse

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

