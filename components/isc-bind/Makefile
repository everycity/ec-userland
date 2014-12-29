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

COMPONENT_NAME=		bind
COMPONENT_VERSION=	9.9.6-P1
IPS_COMPONENT_VERSION=	9.9.6.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:dfedcb2b414d2803accd1a9c21d183178a288f40a2486af5ec0d3369a8cb8526
COMPONENT_ARCHIVE_URL=	ftp://ftp.isc.org/isc/bind9/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-openssl=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-libxml2=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-libtool=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-libiconv=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

