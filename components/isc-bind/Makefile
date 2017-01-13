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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		bind
COMPONENT_VERSION=	9.9.9-P5
IPS_COMPONENT_VERSION=	9.9.9.5
COMPONENT_LICENSE=	BINDv98
COMPONENT_PROJECT_URL=	"http://www.isc.org/software/bind"
COMPONENT_SUMMARY=	ISC Berkeley Internet Name Daemon
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:5ccd1c7356093da100c45dfcea314fea882a41e8e2c660d269c46137212bc1fa
COMPONENT_ARCHIVE_URL=	ftp://ftp.isc.org/isc/bind9/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
COMPONENT_LICENSE_FILE=	COPYRIGHT

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-openssl=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-libxml2=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-libtool=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-libiconv=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

