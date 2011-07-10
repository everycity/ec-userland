#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		live555
COMPONENT_VERSION=	2011.07.08
COMPONENT_SRC=		live
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:35c6523d1082b784db1e91231e2a5501a0b4fc2a
COMPONENT_ARCHIVE_URL=	http://www.live555.com/liveMedia/public/$(COMPONENT_ARCHIVE)

IPS_COMPONENT_VERSION=	2011.7.8

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION+=	( $(CP) -R $(SOURCE_DIR)/* $(@D)/ ; cd $(@D) ; ./genMakefiles solaris-$(BITS)bit )

build:		$(BUILD_32_and_64)

install:	build
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/lib
	$(CP) -R $(BUILD_DIR_32) $(PROTO_DIR)/$(ECPREFIX)/lib/live555-32bit
	$(CP) -R $(BUILD_DIR_64) $(PROTO_DIR)/$(ECPREFIX)/lib/live555-64bit
	$(TOUCH) $@

