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

COMPONENT_NAME=		libtheora
COMPONENT_FMRI=		library/video/theora
COMPONENT_VERSION=	1.1.1
COMPONENT_LICENSE=	libtheora
COMPONENT_PROJECT_URL=	"http://www.theora.org/"
COMPONENT_SUMMARY=	Theora open video compression format
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:40952956c47811928d1e7922cda3bc1f427eb75680c3c37249c91e949054916b
COMPONENT_ARCHIVE_URL=	http://downloads.xiph.org/releases/theora/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

