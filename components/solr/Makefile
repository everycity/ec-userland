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
COMPONENT_VERSION=	3.5.0
COMPONENT_SRC=		apache-solr-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	apache-solr-$(COMPONENT_VERSION).tgz
COMPONENT_ARCHIVE_HASH=	sha1:020fc86dfd2405212c0f706111d8576dbb8e54b4
COMPONENT_ARCHIVE_URL=	http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS +=	$(BUILD_DIR)

build: prep

install: build
	@[ -d $(PROTO_DIR)$(ECPREFIX)/lib/solr ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/solr
	@(cd $(PROTO_DIR)$(ECPREFIX)/lib/solr; unzip -o $(SOURCE_DIR)/dist/apache-solr-$(COMPONENT_VERSION).war)
