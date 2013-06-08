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
# Copyright 2011-2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		vlc
COMPONENT_VERSION=	1.1.13
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:03edec44d463b9f5e7db56fd844c6d4ac79966638e1ac32dedcfb5847a9323c1
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_VIDEOLAN)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk
include ../../make-rules/gnu-ld.mk

LINKER=	gcc

CONFIGURE_ENV.32+=      LDFLAGS="$(LD_BITS) -lnsl -L$(ECPREFIX)/lib -R$(ECPREFIX)/lib -L$(CONFIGURE_PREFIX)/lib -R$(CONFIGURE_PREFIX)/lib -L$(ECPREFIX)/lib/qt/4.7/lib -R$(ECPREFIX)/lib/qt/4.7/lib"
CONFIGURE_ENV.64+=      LDFLAGS="$(LD_BITS) -lnsl -L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64) -L$(CONFIGURE_PREFIX)/lib/$(MACH64) -R$(CONFIGURE_PREFIX)/lib/$(MACH64) -L$(ECPREFIX)/lib/qt/4.7/lib -R$(ECPREFIX)/lib/qt/4.7/lib"
CONFIGURE_ENV+= CFLAGS="$(CC_BITS) -D _XPG4_2 -D __SunOS -D __STDC_ISO_10646__ -D __EXTENSIONS__ -D __EC_SOLARIS_$(subst .,_,$(SOLARIS_VERSION)) -I$(ECPREFIX)/include -I$(ECPREFIX)/include/ncurses"
CONFIGURE_ENV+= CXXFLAGS="$(CC_BITS) -D _XPG4_2 -D __SunOS -D __STDC_ISO_10646__ -D __EXTENSIONS__ -D __EC_SOLARIS_$(subst .,_,$(SOLARIS_VERSION)) -I$(ECPREFIX)/include -I$(ECPREFIX)/include/ncurses"
CONFIGURE_ENV+=	$(CONFIGURE_ENV.$(BITS))

CONFIGURE_OPTIONS+=	--with-pic --enable-shared --disable-static
CONFIGURE_OPTIONS+=	--disable-libgcrypt
CONFIGURE_OPTIONS+=	--disable-remoteosd
CONFIGURE_OPTIONS+=	--disable-glx
CONFIGURE_OPTIONS+=	--disable-lua
CONFIGURE_OPTIONS+=	--disable-a52
CONFIGURE_OPTIONS+=	--disable-sdl
CONFIGURE_OPTIONS+=	--disable-oss
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

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

