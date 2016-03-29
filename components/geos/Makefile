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

COMPONENT_NAME=		geos
COMPONENT_FMRI=		library/geos
COMPONENT_VERSION=	3.5.0
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_PROJECT_URL=	"http://trac.osgeo.org/geos/"
COMPONENT_SUMMARY=	GEOS - Geometry Engine, Open Source
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:49982b23bcfa64a53333dab136b82e25354edeb806e5a2e2f5b8aa98b1d0ae02
COMPONENT_ARCHIVE_URL=	http://download.osgeo.org/geos/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS += 

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

