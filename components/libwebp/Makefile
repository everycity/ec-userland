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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libwebp
COMPONENT_FMRI=         library/libwebp
COMPONENT_VERSION=      0.5.2
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  "https://developers.google.com/speed/webp/"
COMPONENT_SUMMARY=	WebP is a modern image format that provides superior lossless and lossy compression for images on the web
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b75310c810b3eda222c77f6d6c26b061240e3d9060095de44b2c1bae291ecdef
COMPONENT_ARCHIVE_URL=	https://storage.googleapis.com/downloads.webmproject.org/releases/webp/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-libwebpmux --enable-libwebpdemux --enable-libwebpdecoder --enable-libwebpextras

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

