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
# Copyright 2021 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		c-ares
COMPONENT_FMRI=         library/c-ares
COMPONENT_VERSION=      1.17.1
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "https://c-ares.haxx.se/"
COMPONENT_SUMMARY=	c-ares is a C library for asynchronous DNS requests
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d73dd0f6de824afd407ce10750ea081af47eba52b8a6cb307d220131ad93fc40
COMPONENT_ARCHIVE_URL=	https://c-ares.haxx.se/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

