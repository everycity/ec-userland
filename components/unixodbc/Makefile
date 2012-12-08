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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		unixODBC
COMPONENT_VERSION=	2.3.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
    sha256:1f5be3edecff9e31072ef738ea1d8019594c4f0c2e3ab427e6eef153491db6a2
COMPONENT_ARCHIVE_URL=	ftp://ftp.unixodbc.org/pub/unixODBC/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--includedir=$(ECPREFIX)/include/odbc
CONFIGURE_OPTIONS+=	--oldincludedir=$(ECPREFIX)/include/odbc
CONFIGURE_OPTIONS+=	--enable-static=no
CONFIGURE_OPTIONS+=	--enable-shared

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

