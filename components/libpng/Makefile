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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libpng
COMPONENT_FMRI=		library/libpng
COMPONENT_VERSION=	1.6.27
COMPONENT_LICENSE=	libpng
COMPONENT_PROJECT_URL=	http://www.libpng.org/pub/png/
COMPONENT_SUMMARY=	The official PNG reference library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c9d164ec247f426a525a7b89936694aefbc91fb7a50182b198898b8fc91174b4
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic --with-sysroot=/ec

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


