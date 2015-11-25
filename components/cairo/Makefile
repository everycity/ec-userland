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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		cairo
COMPONENT_FMRI=		library/cairo
COMPONENT_VERSION=	1.14.4
COMPONENT_LICENSE=	LGPLv2.1/MPLv1.1
COMPONENT_PROJECT_URL=	"http://cairographics.org/"
COMPONENT_SUMMARY=	The Cairo 2D vector graphics library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:f6ec9c7c844db9ec011f0d66b57ef590c45adf55393d1fc249003512522ee716
COMPONENT_ARCHIVE_URL=	http://cairographics.org/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS +=	--enable-xlib-xrender=no

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

