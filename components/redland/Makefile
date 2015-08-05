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

COMPONENT_NAME=		redland
COMPONENT_FMRI=         library/redland
COMPONENT_VERSION=      1.0.17
COMPONENT_LICENSE=      Apache2.0
COMPONENT_PROJECT_URL=  "http://librdf.org/"
COMPONENT_SUMMARY=	Redland RDF library providing the RDF API and triple stores
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:de1847f7b59021c16bdc72abb4d8e2d9187cd6124d69156f3326dd34ee043681
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_LIBRDF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS+=	-I$(USRDIR)/include/odbc

CONFIGURE_ENV.64+=	PATH=$(USRDIR)/bin/$(MACH64):$(PATH)

CONFIGURE_OPTIONS+=	--with-bdb=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-unixodbc
#CONFIGURE_OPTIONS+=	--with-odbc-inc=$(USRDIR)/include/odbc
#CONFIGURE_OPTIONS+=	--with-odbc-lib=

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

