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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		freetype
COMPONENT_FMRI=		library/freetype2
COMPONENT_VERSION=	2.5.2
COMPONENT_LICENSE=	Freetype
COMPONENT_PROJECT_URL=	"http://www.freetype.org/"
COMPONENT_SUMMARY=	FreeType 2 font engine
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:4ff4bd393aa01071ec7b849d035508a505a78f88b2bcf25ff11e58e43c0b9def
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_SAVANNAH)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

