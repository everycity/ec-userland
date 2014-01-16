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

COMPONENT_NAME=		cairo
COMPONENT_FMRI=		library/cairo
COMPONENT_VERSION=	1.12.16
COMPONENT_LICENSE=	LGPLv2.1/MPLv1.1
COMPONENT_PROJECT_URL=	"http://cairographics.org/"
COMPONENT_SUMMARY=	The Cairo 2D vector graphics library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:2505959eb3f1de3e1841023b61585bfd35684b9733c7b6a3643f4f4cbde6d846
COMPONENT_ARCHIVE_URL=	http://cairographics.org/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS +=	--enable-xlib-xrender=no

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

