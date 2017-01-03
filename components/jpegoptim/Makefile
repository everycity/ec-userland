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

COMPONENT_NAME=		jpegoptim
COMPONENT_FMRI=         graphics/jpegoptim
COMPONENT_VERSION=      1.4.4
COMPONENT_LICENSE=      GPL
COMPONENT_PROJECT_URL=  "https://github.com/tjko/jpegoptim"
COMPONENT_SUMMARY=	utility to optimize/compress JPEG files
COMPONENT_SRC=		$(COMPONENT_NAME)-RELEASE.$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	RELEASE.$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:bc6b018ae8c3eb12d07596693d54243e214780a2a2303a6578747d3671f45da3
COMPONENT_ARCHIVE_URL=	https://github.com/tjko/jpegoptim/archive/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION=	($(CLONEY) $(SOURCE_DIR) $(@D))
#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

