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

COMPONENT_NAME=		yasm
COMPONENT_FMRI=		developer/assembler/yasm
COMPONENT_VERSION=	1.2.0
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.tortall.net/projects/yasm/"
COMPONENT_SUMMARY=	The Yasm Modular Assembler
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:768ffab457b90a20a6d895c39749adb547c1b7cb5c108e84b151a838a23ccf31
COMPONENT_ARCHIVE_URL=	http://www.tortall.net/projects/yasm/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

