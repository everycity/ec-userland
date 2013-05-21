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
# Copyright 2013 EveryCity Ltd. All rights reserved.
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		isc-dhcp
COMPONENT_FMRI=         network/dhcp
COMPONENT_VERSION=      4.2.5-P1
IPS_COMPONENT_VERSION=	4.2.5.1
COMPONENT_LICENSE=      ISC
COMPONENT_PROJECT_URL=  http://www.isc.org/software/dhcp/
COMPONENT_SUMMARY=	Internet Systems Consortium DHCP Client and Server
COMPONENT_SRC=		dhcp-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:59b06c9f5d775e46999b422c45b9229402c462b114ce1685617bfb2b8b028250
COMPONENT_ARCHIVE_URL=	ftp://ftp.isc.org/isc/dhcp/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_SCRIPT	= $(@D)/configure
COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -R $(SOURCE_DIR)/* $(@D)/

CONFIGURE_OPTIONS+=	--sysconfdir=$(ECPREFIX)/etc/dhcp
CONFIGURE_OPTIONS+=	--enable-use-sockets
CONFIGURE_OPTIONS+=	--enable-ipv4-pktinfo
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static

# Disable message in omapip/errwarn.c.
CPPFLAGS  +=	        -DNOMINUM
CONFIGURE_OPTIONS  +=   CPPFLAGS="$(CPPFLAGS)"

build:		$(BUILD_32)

install:	$(INSTALL_32)

