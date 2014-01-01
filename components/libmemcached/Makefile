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

COMPONENT_NAME=		libmemcached
COMPONENT_FMRI=		library/libmemcached
COMPONENT_VERSION=	1.0.17
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://launchpad.net/libmemcached/"
COMPONENT_SUMMARY=	Client library and tools for the memcached server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:7bb27b2589400f918df1cf5002cb01ef7ccac6e23f818604e2386de62c80bba5
COMPONENT_ARCHIVE_URL=	https://launchpad.net/libmemcached/1.0/$(COMPONENT_VERSION)/+download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PATH=	$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin:/usr/sbin

#COMPONENT_POST_CONFIGURE_ACTION = \
#       (cd $(@D) ; \
#        perl -pi -e 's/(^\#define HAVE_HTONLL.*)/\/* $$0 *\//' mem_config.h )

LDFLAGS+=	-lnsl -lsocket

CONFIGURE_OPTIONS+=	--with-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS.32+=	--disable-64bit
CONFIGURE_OPTIONS.64+=	--enable-64bit
#CONFIGURE_OPTIONS+=	--enable-dtrace

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

