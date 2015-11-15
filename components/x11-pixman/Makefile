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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pixman
COMPONENT_FMRI=		x11/library/pixman
COMPONENT_VERSION=	0.32.8
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://cairographics.org/"
COMPONENT_SUMMARY=	Pixman: The pixel-manipulation library for X and Cairo.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:575ade17c40b47d391b02b4c0c63531c897b31e70046c96749514b7d8800d65d
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic --with-sysroot=/ec

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

