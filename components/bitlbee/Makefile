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

COMPONENT_NAME=		bitlbee
COMPONENT_FMRI=         irc/gateway/bitlbee
COMPONENT_VERSION=      3.2.1
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  "http://bitlbee.org/"
COMPONENT_SUMMARY=	An IRC to other chat networks gateway
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:00f411dd7d6d28f30f0e73e46c9cbe88b4006e7f03adfe07b90a97280a290f59
COMPONENT_ARCHIVE_URL=	http://get.bitlbee.org/src/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32)

install:	$(INSTALL_32)

