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

COMPONENT_NAME=		ppl
COMPONENT_FMRI=		library/ppl
COMPONENT_VERSION=	1.0
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	http://bugseng.com/products/ppl/
COMPONENT_SUMMARY=	PPL - Parma Polyhedra Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:c169e962b8a0f7b7bcde5c5e0e2235248f1d78b155dfad684591d1a57e330b54
COMPONENT_ARCHIVE_URL=	http://bugseng.com/products/ppl/download/ftp/releases/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-gmp-prefix=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--disable-static

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

