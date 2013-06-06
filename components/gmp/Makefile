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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gmp
COMPONENT_FMRI=		library/gmp
COMPONENT_VERSION=	5.1.2
COMPONENT_LICENSE=	LGPLv3
COMPONENT_PROJECT_URL=	http://gmplib.org/
COMPONENT_SUMMARY=	The GNU Multiple Precision (Bignum) Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:2099deea64ef3e58ac2b42eaaa0286c3231430a8e893359d806bfa31611c1b8f
COMPONENT_ARCHIVE_URL=	ftp://ftp.gmplib.org/pub/$(COMPONENT_NAME)-$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS+= -fexceptions

CONFIGURE_OPTIONS+=	CPPFLAGS="$(CPPFLAGS)"
CONFIGURE_OPTIONS+=	ABI=$(BITS)
CONFIGURE_OPTIONS+=	--enable-cxx
CONFIGURE_OPTIONS+=	--disable-static

#
# THIS IS A MERGED 32/64 BIT HEADER.  CHECK AND REGENERATE IF BUMPING GMP.
#
COMPONENT_POST_INSTALL_ACTION= ( \
	$(CP) $(COMPONENT_DIR)/files/gmp.h $(PROTO_DIR)$(ECPREFIX)/include/ )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

