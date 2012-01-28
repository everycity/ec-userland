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

COMPONENT_NAME=		libvpx
COMPONENT_VERSION=	1.0.0
COMPONENT_SRC=		$(COMPONENT_NAME)-v$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:2919e11074fef72fc61ef1a75160050ffaad6074
COMPONENT_ARCHIVE_URL=	http://webm.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS = -I$(ECPREFIX)/include
LDFLAGS.32 = -L$(ECPREFIX)/lib -R$(ECPREFIX)/lib
LDFLAGS.64 = -m64 -L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64)
LDFLAGS = $(LDFLAGS.$(BITS))

COMPONENT_BUILD_ENV.32+=        LD_ALTEXEC=$(ECPREFIX)/bin/ld
COMPONENT_BUILD_ENV.64+=        LD_ALTEXEC=$(ECPREFIX)/bin/$(MACH64)/ld
COMPONENT_BUILD_ENV+=           $(COMPONENT_BUILD_ENV.$(BITS))

CONFIGURE_OPTIONS.64 =	--target=x86_64-solaris-gcc
CONFIGURE_OPTIONS =	--prefix=$(CONFIGURE_PREFIX)
CONFIGURE_OPTIONS +=	--enable-pic
CONFIGURE_OPTIONS +=	--libdir=$(CONFIGURE_LIBDIR.$(BITS))
CONFIGURE_OPTIONS +=	--disable-examples
CONFIGURE_OPTIONS +=	--enable-shared
CONFIGURE_OPTIONS +=	--disable-static
CONFIGURE_OPTIONS +=	$(CONFIGURE_OPTIONS.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

