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
# Copyright 2011-2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		db
COMPONENT_FMRI=		database/berkeleydb
COMPONENT_VERSION_MJR=	6.0
COMPONENT_VERSION_MNR=	30
COMPONENT_VERSION=	$(COMPONENT_VERSION_MJR).$(COMPONENT_VERSION_MNR)
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	http://www.oracle.com/technetwork/database/berkeleydb/
COMPONENT_SUMMARY=	Berkeley DB library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2
COMPONENT_ARCHIVE_URL=	http://download.oracle.com/berkeley-db/$(COMPONENT_ARCHIVE)
COMPONENT_AUTOGEN_MANIFEST=	yes
COMPONENT_LICENSE_FILE=	LICENSE

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

CONFIGURE_SCRIPT=	$(SOURCE_DIR)/dist/configure

COMPONENT_INSTALL_ARGS  += docdir=$(USRDIR)/share/doc/$(COMPONENT_NAME)-$(COMPONENT_VERSION)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
