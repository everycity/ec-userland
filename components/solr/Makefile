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

COMPONENT_NAME=		solr
COMPONENT_VERSION=	3.3.0
COMPONENT_SRC=		apache-solr-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	apache-solr-$(COMPONENT_VERSION).tgz
COMPONENT_ARCHIVE_HASH=	sha1:e6017419051e5eda9cb222e3b17006eeed682db9
COMPONENT_ARCHIVE_URL=	 http://mirrors.enquira.co.uk/apache//lucene/solr/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

build: prep

install: build
	@[ -d $(PROTO_DIR)/ec/lib/solr ] || $(MKDIR) $(PROTO_DIR)/ec/lib/solr
	@(cd $(PROTO_DIR)/ec/lib/solr; unzip -o $(SOURCE_DIR)/dist/apache-solr-$(COMPONENT_VERSION).war)
