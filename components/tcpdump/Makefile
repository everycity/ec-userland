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

COMPONENT_NAME=		tcpdump
COMPONENT_FMRI=         network/tcpdump
COMPONENT_VERSION=      4.9.2
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  "http://www.tcpdump.org/"
COMPONENT_SUMMARY=	A powerful command-line packet analyzer
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:798b3536a29832ce0cbb07fafb1ce5097c95e308a6f592d14052e1ef1505fe79
COMPONENT_ARCHIVE_URL=	http://www.tcpdump.org/release/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

