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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		bzr
COMPONENT_FMRI=		developer/versioning/bzr
COMPONENT_VERSION_MAJOR=2.7
COMPONENT_VERSION_MINOR=0
COMPONENT_VERSION=	$(COMPONENT_VERSION_MAJOR).$(COMPONENT_VERSION_MINOR)
COMPONENT_LICENSE=	GPLv2
COMPONENT_SUMMARY=	Bazaar version control system
COMPONENT_PROJECT_URL=	http://bazaar.canonical.com/
COMPONENT_SRC=		bzr-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0d451227b705a0dd21d8408353fe7e44d3a5069e6c4c26e5f146f1314b8fdab3
COMPONENT_ARCHIVE_URL=	https://launchpad.net/bzr/$(COMPONENT_VERSION_MAJOR)/$(COMPONENT_VERSION)/+download/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/setup.py.mk
include ../../../make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)
