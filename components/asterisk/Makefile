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

COMPONENT_NAME=		asterisk
COMPONENT_FMRI=         telephony/asterisk
COMPONENT_VERSION=      11.11.0
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://www.asterisk.org/
COMPONENT_SUMMARY=	An open source telephony switching and private branch exchange service
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:568c9558005e686b020d596556c700ecec910a0c4f81fe54141851d049e222a6
COMPONENT_ARCHIVE_URL=	http://downloads.asterisk.org/pub/telephony/asterisk/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--without-oss
CONFIGURE_OPTIONS+=	--without-postgres

COMPONENT_PRE_CONFIGURE_ACTION=	$(CLONEY) $(SOURCE_DIR) $(@D)

build:		$(BUILD_32)

install:	$(INSTALL_32)

