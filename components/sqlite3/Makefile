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

COMPONENT_NAME=		sqlite3
COMPONENT_FMRI=		database/sqlite-3
COMPONENT_VERSION=	3.8.5.0
COMPONENT_LICENSE=	Public Domain
COMPONENT_PROJECT_URL=	"http://www.sqlite.org/"
COMPONENT_SUMMARY=	SQL database engine library
COMPONENT_SRC=		sqlite-autoconf-3080500
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:98c33abe4106e508e73fda648b2657ac9e969fe24695f543dcde68cc71f3091b
COMPONENT_ARCHIVE_URL=	http://www.sqlite.org/2014/$(COMPONENT_ARCHIVE)
COMPONENT_AUTOGEN_MANIFEST=	yes
COMPONENT_LICENSE_FILE=	sqlite3.license

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

