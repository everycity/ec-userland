#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		x264
COMPONENT_VERSION=	20110614-2245
COMPONENT_SRC=		$(COMPONENT_NAME)-snapshot-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:947f870cb77935d73be5e6f0ad9bc2e7435b9d66
COMPONENT_ARCHIVE_URL=	http://svn.everycity.co.uk/public/solaris/misc/$(COMPONENT_ARCHIVE)

IPS_COMPONENT_VERSION=	2011.6.14

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS=	--prefix=$(ECPREFIX)	
CONFIGURE_OPTIONS.32+=	--bindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64+=	--bindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32+=	--libdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS.64+=	--libdir=$(ECPREFIX)/lib/$(MACH64)
CONFIGURE_OPTIONS.64+=	--host=x86_64-pc-solaris2.10
CONFIGURE_OPTIONS.64+=	--extra-cflags=-m64
CONFIGURE_OPTIONS.64+=	--extra-ldflags="-L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64) -m64"
CONFIGURE_OPTIONS+=	--enable-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -R $(SOURCE_DIR)/* $(@D)/
COMPONENT_BUILD_ENV.32+=LD_ALTEXEC=$(ECPREFIX)/bin/ld
COMPONENT_BUILD_ENV.64+=LD_ALTEXEC=$(ECPREFIX)/bin/$(MACH64)/ld CFLAGS=-m64 LDFLAGS=-m64
COMPONENT_BUILD_ENV+=$(COMPONENT_BUILD_ENV.$(BITS))
COMPONENT_INSTALL_ENV+=$(COMPONENT_BUILD_ENV.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

