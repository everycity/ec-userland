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

COMPONENT_NAME=		libwps
COMPONENT_FMRI=         library/libwps
COMPONENT_VERSION=      0.3.0
COMPONENT_LICENSE=      LGPLv2.1
COMPONENT_PROJECT_URL=  "http://libwps.sourceforge.net/"
COMPONENT_SUMMARY=	libwps is a library for importing the Microsoft Works word processor file format
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:243d1dfc9bb53ac9d05405379a119e9b7d999714de3a3d56f4d3c505cedad43a
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

