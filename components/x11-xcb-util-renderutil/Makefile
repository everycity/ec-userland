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

COMPONENT_NAME=		xcb-util-renderutil
COMPONENT_FMRI=		x11/library/xcb-util-renderutil
COMPONENT_VERSION=	0.3.8
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://xcb.freedesktop.org/"
COMPONENT_SUMMARY=	XCB Util Renderutil Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:cfa1130bfff8f281e10285ae063475dd172c78dad609ac10bce3924b5ca11484
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_XCB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_LICENSE_FILE=	$(COMPONENT_NAME).license

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic --with-sysroot=/ec

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


