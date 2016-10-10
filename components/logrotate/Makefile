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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		logrotate
COMPONENT_FMRI=		system/logrotate
COMPONENT_VERSION=	3.9.1
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"https://fedorahosted.org/logrotate/"
COMPONENT_SUMMARY=	Automatic rotation, compression, removal and mailing of log files
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:022769e3288c80981559a8421703c88e8438b447235e36dd3c8e97cd94c52545
COMPONENT_ARCHIVE_URL=	https://fedorahosted.org/releases/l/o/logrotate/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) && ./autogen.sh )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

