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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		exiftool
COMPONENT_VERSION=	9.02
IPS_COMPONENT_VERSION=	9.2
COMPONENT_SRC=		Image-ExifTool-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:48de825b264e28b15723f87892d2af50f94352646621bd2221ab299777c3986e
COMPONENT_ARCHIVE_URL=	http://owl.phy.queensu.ca/~phil/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk
include ../../make-rules/makemaker.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

