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

COMPONENT_NAME=		libwpd
COMPONENT_FMRI=         library/libwpd
COMPONENT_VERSION=      0.10.0
COMPONENT_LICENSE=      LGPLv2.1
COMPONENT_PROJECT_URL=  "http://libwpd.sourceforge.net/"
COMPONENT_SUMMARY=	libwpd is a C++ library designed to help process WordPerfect documents
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:f2bf5d65156a351ce404550dd822c8db8ab8740b393f61dba828d1b2cb33fe91
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

