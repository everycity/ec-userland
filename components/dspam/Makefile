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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		dspam
COMPONENT_FMRI=         security/antispam/dspam
COMPONENT_VERSION=      3.10.2
COMPONENT_LICENSE=      AGPLv3
COMPONENT_PROJECT_URL=  http://sourceforge.net/projects/dspam/
COMPONENT_SUMMARY=	DSPAM is a scalable and open-source content-based spam filter designed for multi-user enterprise systems.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ae76569604021f35b741fb95198a1e611a8c64c3838661973a6cf360bba593a9
COMPONENT_ARCHIVE_URL=	http://sourceforge.net/projects/$(COMPONENT_NAME)/files/$(COMPONENT_NAME)/$(COMPONENT_SRC)/$(COMPONENT_ARCHIVE)/download

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# Build not thread safe
override COMPONENT_BUILD_GMAKE_ARGS=

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

