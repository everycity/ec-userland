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

COMPONENT_NAME=		file
COMPONENT_FMRI=		file/file
COMPONENT_VERSION=	5.21
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://darwinsys.com/file/"
COMPONENT_SUMMARY=	file - a file type guesser
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1a48741d3923c4cc73267109b8a396c0ce3aebe004181f3efb1b0a228d230bb6
COMPONENT_ARCHIVE_URL=	ftp://ftp.astron.com/pub/file/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
