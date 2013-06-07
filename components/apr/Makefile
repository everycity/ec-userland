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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		apr
COMPONENT_VERSION=	1.4.6
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:9b635e60feb163e6fc6c375721f71f44d7e26d6b9cd52f6b86b04e65d2481cbc
COMPONENT_ARCHIVE_URL=	http://mirror.cc.columbia.edu/pub/software/apache/apr/$(COMPONENT_ARCHIVE)
#COMPONENT_ARCHIVE_URL=	$(APACHE_ARCHIVE)/apr/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS.32	+=	--with-installbuilddir=$(ECPREFIX)/share/apr-1.0/build
CONFIGURE_OPTIONS.64	+=	--with-installbuilddir=$(ECPREFIX)/share/apr-1.0/build/$(MACH64)
CONFIGURE_OPTIONS.32	+=	--includedir=$(ECPREFIX)/include/apr-1.0
CONFIGURE_OPTIONS.64	+=	--includedir=$(ECPREFIX)/include/apr-1.0/$(MACH64)

CONFIGURE_OPTIONS	+=	--enable-threads
CONFIGURE_OPTIONS	+=	--enable-other-child
CONFIGURE_OPTIONS	+=	--enable-nonportable-atomics
CONFIGURE_OPTIONS	+=	--enable-shared


COMPONENT_POST_INSTALL_ACTION = ( strip \
		$(PROTO_DIR)$(ECPREFIX)/lib/*so* \
                $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/*so* \
                >/dev/null 2>&1; true )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
