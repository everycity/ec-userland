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

COMPONENT_NAME=		xz
COMPONENT_FMRI=		compress/xz
COMPONENT_VERSION=	5.0.5
COMPONENT_LICENSE=	Public Domain,LGPLv2.1,GPLv2
COMPONENT_PROJECT_URL=	"http://tukanni.org/xz"
COMPONENT_SUMMARY=	XZ Utils - general-purpose data compression software
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:5dcffe6a3726d23d1711a65288de2e215b4960da5092248ce63c99d50093b93a
COMPONENT_ARCHIVE_URL=	http://tukaani.org/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS  +=           --disable-static

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test32:		$(BUILD_32)
	(cd $(BUILD_DIR_32); env - $(GMAKE) check)

test64:		$(BUILD_64)
	(cd $(BUILD_DIR_64); env - $(GMAKE) check)

test:	test32 test64

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
