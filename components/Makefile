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

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lucene
COMPONENT_VERSION=	3.4.0
COMPONENT_SRC=		lucene-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	lucene-$(COMPONENT_VERSION).tgz
COMPONENT_ARCHIVE_URL=	 http://mirrors.enquira.co.uk/apache/lucene/java/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/ips.mk

build: prep

install: build
	@[ -d $(PROTO_DIR)/ec/lib/lucene ] || $(MKDIR) $(PROTO_DIR)/ec/lib/lucene
	@(cd $(PROTO_DIR)/ec/lib/lucene; unzip -o $(SOURCE_DIR)/lucene-core-$(COMPONENT_VERSION).jar)
