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

COMPONENT_NAME=		arping
COMPONENT_FMRI=		network/arping
COMPONENT_VERSION=	2.17
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=  "http://www.habets.pp.se/synscan/programs.php?prog=arping"
COMPONENT_SUMMARY=	ARP-level ping utility
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b954655b2121abc086bb4464de2e242b5da643c3621edfdd3853118ea438ed01
COMPONENT_ARCHIVE_URL=	http://www.habets.pp.se/synscan/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)
