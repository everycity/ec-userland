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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ag
COMPONENT_FMRI=         text/ag
COMPONENT_VERSION=      2.1.0
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  "http://geoff.greer.fm/ag/"
COMPONENT_SUMMARY=	A code-searching tool similar to ack, but faster
COMPONENT_SRC=		the_silver_searcher-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d4652bd91c3a05e87a15809c5f3f14ad2e5e1f80185af510e3fa4ad2038c15d4
COMPONENT_ARCHIVE_URL=	https://geoff.greer.fm/ag/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

