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

COMPONENT_NAME=		libmms
COMPONENT_FMRI=		multimedia/libmms
COMPONENT_VERSION=	0.6.4
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_PROJECT_URL=	"http://sourceforge.net/projects/libmms/"
COMPONENT_SUMMARY=	Library for downloading (streaming) media files using the mmst and mmsh protocols
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3c05e05aebcbfcc044d9e8c2d4646cd8359be39a3f0ba8ce4e72a9094bee704f
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-lsocket

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

