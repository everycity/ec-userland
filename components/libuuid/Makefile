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

COMPONENT_NAME=		libuuid
COMPONENT_REAL_NAME=	e2fsprogs-libs
COMPONENT_VERSION=	1.42.6
COMPONENT_SRC=		$(COMPONENT_REAL_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:f03956791b63d63a4c5233a1479ba639dd30be954bdd7574a33038d6c77dbd30
COMPONENT_ARCHIVE_URL=	http://kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.42.6/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS += -lsocket -lnsl

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) ; libtoolize --force --copy ; autoreconf )

CONFIGURE_OPTIONS+=	--enable-libuuid
CONFIGURE_OPTIONS+=	--enable-elf-shlibs
CONFIGURE_OPTIONS+=	--disable-nls

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
