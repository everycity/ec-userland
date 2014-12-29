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

COMPONENT_NAME=		ag
COMPONENT_FMRI=         text/ag
COMPONENT_VERSION=      0.27.0
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  "http://geoff.greer.fm/ag/"
COMPONENT_SUMMARY=	A code-searching tool similar to ack, but faster
COMPONENT_SRC=		the_silver_searcher-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:32172858385e2b8bea4c91572a3815368e582539585fd98e71c54b41de18a06a
COMPONENT_ARCHIVE_URL=	http://geoff.greer.fm/ag/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

