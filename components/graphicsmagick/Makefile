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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		GraphicsMagick
COMPONENT_FMRI=         multimedia/graphicsmagick
COMPONENT_VERSION=      1.3.32
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://www.graphicsmagick.org/"
COMPONENT_SUMMARY=	GraphicsMagick is the swiss army knife of image processing.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:b842a5a0d6c84fd6c5f161b5cd8e02bbd210b0c0b6728dd762b7c53062ba94e1
SF_PROJECT_NAME=	graphicsmagick
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --with-pic --with-umem

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

