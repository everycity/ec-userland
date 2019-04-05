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

COMPONENT_NAME=		db
COMPONENT_FMRI=		database/berkeleydb-62
COMPONENT_VERSION_MJR=	6.2
COMPONENT_VERSION_MNR=	32
COMPONENT_VERSION=	$(COMPONENT_VERSION_MJR).$(COMPONENT_VERSION_MNR)
COMPONENT_LICENSE=	BSD
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=	http://www.oracle.com/technetwork/database/berkeleydb/
COMPONENT_SUMMARY=	Berkeley DB library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:a9c5e2b004a5777aa03510cfe5cd766a4a3b777713406b02809c17c8e0e7a8fb
COMPONENT_ARCHIVE_URL=	http://download.oracle.com/berkeley-db/$(COMPONENT_ARCHIVE)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

CONFIGURE_SCRIPT=	$(SOURCE_DIR)/dist/configure

CONFIGURE_OPTIONS+=	--includedir=$(USRINCDIR)/$(COMPONENT_NAME)-$(COMPONENT_VERSION_MJR)
CONFIGURE_OPTIONS+=	--program-suffix=-$(COMPONENT_VERSION_MJR)

COMPONENT_INSTALL_ARGS  += docdir=$(USRSHAREDOCDIR)/$(COMPONENT_NAME)-$(COMPONENT_VERSION_MJR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
