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

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		solr
COMPONENT_VERSION=	3.5.0
COMPONENT_SRC=		apache-solr-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	apache-solr-$(COMPONENT_VERSION).tgz
COMPONENT_ARCHIVE_HASH=	sha256:804f3ba9d1296f81388605a79538b7362355693fbdd03b7b2dbf9a706bf1d1d0
COMPONENT_ARCHIVE_URL=	$(APACHE_ARCHIVE)/lucene/$(COMPONENT_NAME)/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS +=	$(BUILD_DIR)

build: prep

install: build
	@[ -d $(PROTO_DIR)$(ECPREFIX)/lib/solr ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/solr
	@(cd $(PROTO_DIR)$(ECPREFIX)/lib/solr; unzip -o $(SOURCE_DIR)/dist/apache-solr-$(COMPONENT_VERSION).war)
