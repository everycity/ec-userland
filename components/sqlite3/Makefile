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

COMPONENT_NAME=		sqlite3
COMPONENT_FMRI=		database/sqlite-3
COMPONENT_VERSION=	3.8.1
COMPONENT_LICENSE=	Public Domain
COMPONENT_PROJECT_URL=	"http://www.sqlite.org/"
COMPONENT_SUMMARY=	SQL database engine library
COMPONENT_SRC=		sqlite-autoconf-3080100
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:176df9a5dfbf4cf8516ef7b91ee187779855f51d4502534a5826034458ba2bb5
COMPONENT_ARCHIVE_URL=	http://www.sqlite.org/2013/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
