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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		awstats
COMPONENT_VERSION=	7.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:733fa7d6a540f4a54f52c69a5f271c789472b0b7
COMPONENT_ARCHIVE_URL=	http://kent.dl.sourceforge.net/project/awstats/AWStats/7.0/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

build:		prep

install:	build
	[ -d $(PROTO_DIR) ] || $(MKDIR) $(PROTO_DIR)
