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

COMPONENT_NAME=		ucarp
COMPONENT_FMRI=		network/ucarp
COMPONENT_VERSION=	1.5.2
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.ucarp.org/project/ucarp"
COMPONENT_SUMMARY=	Common Address Redundancy Protocol (CARP) for Unix
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:f2e013653484cabd616d812648c83a490ae7b2968b4d446da5dd969275f92d62
COMPONENT_ARCHIVE_URL=	ftp://ftp.ucarp.org/pub/ucarp/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)
