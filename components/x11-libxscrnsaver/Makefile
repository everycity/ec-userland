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

COMPONENT_NAME=		libXScrnSaver
COMPONENT_FMRI=         x11/library/libxscrnsaver
COMPONENT_VERSION=      1.2.2
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://cgit.freedesktop.org/xorg/lib/libXScrnSaver/"
COMPONENT_SUMMARY=	X11 MIT-SCREEN-SAVER extension
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e12ba814d44f7b58534c0d8521e2d4574f7bf2787da405de4341c3b9f4cc8d96
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

