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

COMPONENT_NAME=		libxcb
COMPONENT_FMRI=		x11/library/xcb
COMPONENT_VERSION=	1.10
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://xcb.freedesktop.org/"
COMPONENT_SUMMARY=	The X protocol C-language Bindings
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c4cd324ac7bf810e95b1c1b56f413b13850eaa1d7eca60ddc46c61ac9d5f4441
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_XCB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
# --with-sysroot=/ec

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


