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

COMPONENT_NAME=		xcb-proto
COMPONENT_FMRI=		x11/header/xcb-protocols
COMPONENT_VERSION=	1.10
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://xcb.freedesktop.org/"
COMPONENT_SUMMARY=	XML-XCB protocol descriptions
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d0e6a2c8aed8af430edd011bb139368480d556b0829adcf1e1ca5708d1fc04b9
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_XCB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS += --enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS += --with-sysroot=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


