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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		x264
COMPONENT_VERSION=	20120605-2245
COMPONENT_SRC=		$(COMPONENT_NAME)-snapshot-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
#COMPONENT_ARCHIVE_HASH=	sha1:947f870cb77935d73be5e6f0ad9bc2e7435b9d66
COMPONENT_ARCHIVE_URL=	http://svn.everycity.co.uk/public/solaris/misc/$(COMPONENT_ARCHIVE)

IPS_COMPONENT_VERSION=	2012.6.5

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk
include ../../make-rules/gnu-ld.mk

CFLAGS=-I/ec/include

CONFIGURE_OPTIONS=	--prefix=$(ECPREFIX)	
CONFIGURE_OPTIONS.32+=	--bindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64+=	--bindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32+=	--libdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS.64+=	--libdir=$(ECPREFIX)/lib/$(MACH64)
CONFIGURE_OPTIONS.64+=	--host=x86_64-pc-solaris$(SOLARIS_VERSION)
CONFIGURE_OPTIONS.64+=	--extra-cflags="$(CFLAGS)"
CONFIGURE_OPTIONS+=	--extra-ldflags="$(LDFLAGS)"
CONFIGURE_OPTIONS+=	--enable-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -R $(SOURCE_DIR)/* $(@D)/

COMPONENT_BUILD_ENV.64+=CFLAGS=-m64 LDFLAGS=-m64
COMPONENT_BUILD_ENV+=$(COMPONENT_BUILD_ENV.$(BITS))
COMPONENT_INSTALL_ENV+=$(COMPONENT_BUILD_ENV.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

