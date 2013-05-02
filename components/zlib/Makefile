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
# Copyright 2012-2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		zlib
COMPONENT_FMRI=         library/zlib
COMPONENT_VERSION=	1.2.8
COMPONENT_LICENSE=      zlib
COMPONENT_PROJECT_URL=  http://www.zlib.net/
COMPONENT_SUMMARY=      Zlib data compression library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d
COMPONENT_ARCHIVE_URL=	http://downloads.sourceforge.net/project/libpng/$(COMPONENT_NAME)/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

# Not gnu-autoconf
COMPONENT_BUILD_ENV+=  LDFLAGS="$(LDFLAGS)"
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

