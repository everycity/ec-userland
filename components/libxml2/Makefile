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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libxml2
COMPONENT_FMRI=		library/libxml2
COMPONENT_VERSION=	2.9.8
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://xmlsoft.org/"
COMPONENT_SUMMARY=	The XML library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0b74e51595654f958148759cfef0993114ddccccbb6f31aee018f3558e8e2732
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XMLSOFT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS+=	-std=c99

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

