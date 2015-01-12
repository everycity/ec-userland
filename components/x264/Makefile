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
COMPONENT_VERSION=	20140529-2245
IPS_COMPONENT_VERSION=	2014.5.29
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.videolan.org/developers/x264.html"
COMPONENT_SUMMARY=	H.264/MPEG-4 AVC video encoder library
COMPONENT_SRC=		$(COMPONENT_NAME)-snapshot-$(COMPONENT_VERSION)-stable
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:c93e805651613cdd02a40caf63174fef946e40cacf1ecf0fb1dc212f9000e65b
COMPONENT_ARCHIVE_URL=	ftp://ftp.videolan.org/pub/x264/snapshots/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS=	--prefix=$(USRDIR)	
CONFIGURE_OPTIONS.32+=	--bindir=$(USRDIR)/bin
CONFIGURE_OPTIONS.64+=	--bindir=$(USRDIR)/bin/$(MACH64)
CONFIGURE_OPTIONS.32+=	--libdir=$(USRDIR)/lib
CONFIGURE_OPTIONS.64+=	--libdir=$(USRDIR)/lib/$(MACH64)
CONFIGURE_OPTIONS.64+=	--host=$(GNU_ARCH_64)
CONFIGURE_OPTIONS+=	--enable-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -R $(SOURCE_DIR)/* $(@D)/

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

