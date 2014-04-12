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

COMPONENT_NAME=		xcb-util-image
COMPONENT_FMRI=		x11/library/xcb-util-image
COMPONENT_VERSION=	0.3.9
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://xcb.freedesktop.org/"
COMPONENT_SUMMARY=	XCB Util Image Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ac7fa09eddc9ecda6fd872d32b6dc23d451a1c6c201873dfe7cac8362c87acf3
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_XCB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic --with-sysroot=/ec

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


