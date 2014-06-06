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

COMPONENT_NAME=		re-alpine
COMPONENT_FMRI=         mail/re-alpine
COMPONENT_VERSION=      2.03
IPS_COMPONENT_VERSION=	2.3
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  "http://sourceforge.net/projects/re-alpine/"
COMPONENT_SUMMARY=	The continuation of the Alpine email client from University of Washington.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:70d9324b2a93a5c268a3f8b05449d33e1c79acd23d1bce2a9d95b334d7bfba87
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)
#COMPONENT_ARCHIVE_URL=	http://sourceforge.net/projects/re-alpine/files/re-alpine-2.03.tar.bz2/download$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS +=	-lcrypto -lnsl

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS+=	--with-ssl-dir=$(ECPREFIX)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

