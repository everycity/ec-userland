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

COMPONENT_NAME=		xterm
COMPONENT_FMRI=		terminal/xterm
COMPONENT_VERSION=	300
COMPONENT_LICENSE=	xterm
COMPONENT_PROJECT_URL=	"http://invisible-island.net/xterm/"
COMPONENT_SUMMARY=	The xterm program is a terminal emulator for the X Window System.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:615095640cc357405ecae3521b00d8027b3016d21ea235e337f3bed0083e17cd
COMPONENT_ARCHIVE_URL=	http://invisible-island.net/datafiles/release/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

