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

COMPONENT_NAME=		zlib
COMPONENT_FMRI=         library/zlib
COMPONENT_VERSION=	1.2.11
COMPONENT_LICENSE=      zlib
COMPONENT_PROJECT_URL=  http://www.zlib.net/
COMPONENT_SUMMARY=      Zlib data compression library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1
SF_PROJECT_NAME=	libpng
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

# Not gnu-autoconf
CONFIGURE_OPTIONS.32=
CONFIGURE_OPTIONS.64=	--64
CONFIGURE_OPTIONS=	--prefix=$(CONFIGURE_PREFIX)
CONFIGURE_OPTIONS+=	--eprefix=$(CONFIGURE_PREFIX)
CONFIGURE_OPTIONS+=	--libdir=$(CONFIGURE_LIBDIR.$(BITS))
CONFIGURE_OPTIONS+=	--includedir=$(CONFIGURE_PREFIX)/include
CONFIGURE_OPTIONS+=	--shared
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

