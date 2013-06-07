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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		awstats
COMPONENT_VERSION=	7.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e2651d4a5ff40e1d792b37cc13784d444cae479b4f98118aed27f46f5a18ce92
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../../make-rules/prep.mk
include ../../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

build:		prep

install:	build
	[ -d $(PROTO_DIR) ] || $(MKDIR) $(PROTO_DIR)
