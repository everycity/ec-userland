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
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		bind
COMPONENT_VERSION=	9.8.4-P1
IPS_COMPONENT_VERSION=	9.8.4.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:60c979575bf6288570cb4e3e9ab9d99bb93a55d2a4946ce277f6e6e642dda21f
COMPONENT_ARCHIVE_URL=	ftp://ftp.isc.org/isc/bind9/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS	+=	--disable-static --enable-shared --with-pic --with-openssl=$(ECPREFIX)
CONFIGURE_OPTIONS	+=	--with-libxml2=$(ECPREFIX) --with-libtool=$(ECPREFIX) --with-libiconv=$(ECPREFIX)
CONFIGURE_OPTIONS.32	+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64	+=	--sbindir=$(ECPREFIX)/bin/$(MACH64)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

