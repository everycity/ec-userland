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

COMPONENT_NAME=		lcms2
COMPONENT_FMRI=         library/lcms2
COMPONENT_VERSION=      2.5
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://www.littlecms.com/"
COMPONENT_SUMMARY=	Open source colour management engine
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6727772b44470a2111dba53b9ce4c952b87e7d1b72a31c5ebdf44ba6eb0aa72b
SF_PROJECT_NAME=	lcms
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

