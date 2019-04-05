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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		sqlite3
COMPONENT_FMRI=		database/sqlite-3
COMPONENT_VERSION=	3.27.2
COMPONENT_LICENSE=	Public Domain
COMPONENT_PROJECT_URL=	"http://www.sqlite.org/"
COMPONENT_SUMMARY=	SQL database engine library
COMPONENT_SRC=		sqlite-autoconf-3270200
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:50c39e85ea28b5ecfdb3f9e860afe9ba606381e21836b2849efca6a0bfe6ef6e
COMPONENT_ARCHIVE_URL=	http://www.sqlite.org/2019/$(COMPONENT_ARCHIVE)
COMPONENT_LICENSE_FILE=	sqlite3.license

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

