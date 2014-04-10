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

COMPONENT_NAME=		x264
COMPONENT_FMRI=		library/video/x264
COMPONENT_VERSION=	20140409-2245
IPS_COMPONENT_VERSION=	2014.4.9
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.videolan.org/developers/x264.html"
COMPONENT_SUMMARY=	H.264/MPEG-4 AVC video encoder library
COMPONENT_SRC=		$(COMPONENT_NAME)-snapshot-$(COMPONENT_VERSION)-stable
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:d877d4eeb42ae549d4b0ea049a8ad89a816efea8f88891f06fa1e977b25f86e3
COMPONENT_ARCHIVE_URL=	ftp://ftp.videolan.org/pub/x264/snapshots/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS=	--prefix=$(ECPREFIX)	
CONFIGURE_OPTIONS.32+=	--bindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64+=	--bindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32+=	--libdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS.64+=	--libdir=$(ECPREFIX)/lib/$(MACH64)
CONFIGURE_OPTIONS.64+=	--host=x86_64-pc-solaris$(SOLARIS_VERSION)
CONFIGURE_OPTIONS+=	--enable-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -R $(SOURCE_DIR)/* $(@D)/

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

