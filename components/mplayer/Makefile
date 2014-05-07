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

COMPONENT_NAME=		MPlayer
COMPONENT_FMRI=		multimedia/mplayer
COMPONENT_VERSION=	1.1.1
IPS_COMPONENT_VERSION=	2013.1.1.1
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.mplayerhq.hu"
COMPONENT_SUMMARY=	The Movie Player
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:ce8fc7c3179e6a57eb3a58cb7d1604388756b8a61764cc93e095e7aff3798c76
COMPONENT_ARCHIVE_URL=	http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.1.1.tar.xz

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS +=	-fomit-frame-pointer

CONFIGURE_OPTIONS=	--prefix=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--mandir=$(ECPREFIX)/share/man
CONFIGURE_OPTIONS.32=	--bindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.32+=	--libdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS.64=	--bindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.64+=	--libdir=$(ECPREFIX)/lib/$(MACH64)

CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -R $(SOURCE_DIR)/* $(@D)/

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

