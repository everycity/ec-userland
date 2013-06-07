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

COMPONENT_NAME=		lucene
COMPONENT_VERSION=	3.4.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha256:56fa8afd3b9cbce1b990aa10dd9af30aef434a06506f08814fb6b8c7c526af57
COMPONENT_ARCHIVE_URL=	$(APACHE_ARCHIVE)/$(COMPONENT_NAME)/java/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS +=	$(BUILD_DIR)

build:		prep

install:	build
	@[ -d $(PROTO_DIR)$(ECPREFIX)/share/lucene ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/lucene
	@[ -d $(PROTO_DIR)$(ECPREFIX)/share/doc/lucene ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/doc/lucene
	@( cp $(SOURCE_DIR)/*.txt $(PROTO_DIR)$(ECPREFIX)/share/doc/lucene/ )
	@( find $(SOURCE_DIR) -type f -name "*.jar" -exec cp {} $(PROTO_DIR)$(ECPREFIX)/share/lucene/ \; )
