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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		collectd
COMPONENT_FMRI=		monitoring/collectd
COMPONENT_VERSION=	5.6.2
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"https://collectd.org/"
COMPONENT_SUMMARY=	collectd is a daemon which collects system and application performance metrics
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:cc0b4118a91e5369409ced22d1d8a85c1a400098419414160c1839268ecad0c6
COMPONENT_ARCHIVE_URL=	https://storage.googleapis.com/collectd-tarballs/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PATH.32=$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64=$(ECPREFIX)/bin/$(MACH64):$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH=$(PATH.$(BITS))

CONFIGURE_OPTIONS+=	--enable-mysql --enable-postgresql

CFLAGS+=	-std=gnu99 -fno-strict-aliasing
LDFLAGS+=	-L/ec/lib/postgres/9.4/lib/amd64 -R/ec/lib/postgres/9.4/lib/amd64

build:		$(BUILD_64)

install:	$(INSTALL_64)
