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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mysql-proxy
COMPONENT_FMRI=         database/mysql-proxy-55
COMPONENT_VERSION=      0.8.5
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  "http://dev.mysql.com/doc/mysql-proxy/en/"
COMPONENT_SUMMARY=	MySQL Proxy provides communication between one or more MySQL servers and one or more MySQL clients
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e5bac3df8bca2eed41cdbf09439264b34c77339cfe1eda506b0d76eaa2d2b2d5
COMPONENT_ARCHIVE_URL=	http://dev.mysql.com/get/Downloads/MySQL-Proxy/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PATH=   $(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin:/usr/sbin

LDFLAGS+=	-llua

CONFIGURE_OPTIONS+=	--enable-dtrace
CONFIGURE_OPTIONS.32+=	--with-mysql=$(ECPREFIX)/lib/mysql/5.5/bin/mysql_config
CONFIGURE_OPTIONS.64+=	--with-mysql=$(ECPREFIX)/lib/mysql/5.5/bin/$(MACH64)/mysql_config

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

