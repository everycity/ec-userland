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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		apr
COMPONENT_FMRI=		library/apr-15
COMPONENT_VERSION=	1.5.1
COMPONENT_LICENSE=	APLv2
COMPONENT_PROJECT_URL=	http://apr.apache.org/
COMPONENT_SUMMARY=	Apache Portable Runtime (APR)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:e94abe431d4da48425fcccdb27b469bd0f8151488f82e5630a56f26590e198ac
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS.32	+=	--with-installbuilddir=$(USRDIR)/share/apr-1.0/build
CONFIGURE_OPTIONS.64	+=	--with-installbuilddir=$(USRDIR)/share/apr-1.0/build/$(MACH64)
CONFIGURE_OPTIONS.32	+=	--includedir=$(USRDIR)/include/apr-1.0
CONFIGURE_OPTIONS.64	+=	--includedir=$(USRDIR)/include/apr-1.0/$(MACH64)

CONFIGURE_OPTIONS	+=	--enable-threads
CONFIGURE_OPTIONS	+=	--enable-other-child
CONFIGURE_OPTIONS	+=	--enable-nonportable-atomics
CONFIGURE_OPTIONS	+=	--enable-shared

COMPONENT_PRE_CONFIGURE_ACTION= ( $(CLONEY) $(SOURCE_DIR) $(@D) );

CONFIGURE_SCRIPT=       $(@D)/configure

#COMPONENT_POST_INSTALL_ACTION = ( strip \
#		$(PROTO_DIR)$(USRDIR)/lib/*so* \
#                $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/*so* \
#                >/dev/null 2>&1; true )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
