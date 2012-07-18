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
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ffmpeg
COMPONENT_VERSION=	0.11.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:b01ddfb6352c84810879988f43172c5f7be555697edb929625845c7bb953fa96
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
CONFIGURE_OPTIONS+=	--extra-cflags="$(CFLAGS)"
CONFIGURE_OPTIONS+=	--extra-ldflags="$(LDFLAGS)"

CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--enable-nonfree
CONFIGURE_OPTIONS+=	--enable-version3
CONFIGURE_OPTIONS+=	--enable-gpl

CONFIGURE_OPTIONS+=	--enable-sse
CONFIGURE_OPTIONS+=	--enable-ssse3
CONFIGURE_OPTIONS+=	--enable-mmx
CONFIGURE_OPTIONS+=	--enable-mmx2
CONFIGURE_OPTIONS+=	--enable-yasm

CONFIGURE_OPTIONS+=	--enable-libfaac
CONFIGURE_OPTIONS+=	--enable-libopenjpeg
CONFIGURE_OPTIONS+=	--enable-libschroedinger
CONFIGURE_OPTIONS+=	--enable-libvpx
CONFIGURE_OPTIONS+=	--enable-libx264
CONFIGURE_OPTIONS+=	--enable-libxvid
CONFIGURE_OPTIONS+=	--enable-libgsm
CONFIGURE_OPTIONS+=	--enable-libspeex
CONFIGURE_OPTIONS+=	--enable-libvorbis
CONFIGURE_OPTIONS+=	--enable-libmp3lame
CONFIGURE_OPTIONS+=	--enable-libtheora
CONFIGURE_OPTIONS+=	--enable-libopencore-amrnb
CONFIGURE_OPTIONS+=	--enable-libopencore-amrwb
CONFIGURE_OPTIONS+=	--enable-librtmp

CONFIGURE_OPTIONS+=	--disable-ffplay
CONFIGURE_OPTIONS+=	--disable-avdevice

CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	\
	/bin/echo "\#define FFMPEG_VERSION \"$(COMPONENT_VERSION)\"" > $(SOURCE_DIR)/version.h

COMPONENT_POST_BUILD_ACTION=	(cd $(@D) ; $(ENV) $(COMPONENT_BUILD_ENV) \
	$(GMAKE) alltools)

BINDIR.32=      $(CONFIGURE_PREFIX)/bin
BINDIR.64=      $(CONFIGURE_PREFIX)/bin/$(MACH64)

COMPONENT_POST_INSTALL_ACTION=  ( cd $(@D) ; cp tools/cws2fws tools/graph2dot tools/lavfi-showfiltfmts \
        tools/pktdumper tools/probetest tools/qt-faststart tools/trasher $(PROTO_DIR)$(BINDIR.$(BITS)) )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

