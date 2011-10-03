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
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha1:51ef0cd6cc1aa09556f9948c74dd3a4da168baca
COMPONENT_ARCHIVE_URL=	http://www.mirrorservice.org/sites/ftp.apache.org/lucene/java/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS +=	$(BUILD_DIR)

build:		prep

install:	build
	@[ -d $(PROTO_DIR)$(ECPREFIX)/share/lucene ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/lucene
	@[ -d $(PROTO_DIR)$(ECPREFIX)/share/doc/lucene ] || $(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/doc/lucene
	@( cp $(SOURCE_DIR)/*.txt $(PROTO_DIR)$(ECPREFIX)/share/doc/lucene/ )
	@( find $(SOURCE_DIR) -type f -name "*.jar" -exec cp {} $(PROTO_DIR)$(ECPREFIX)/share/lucene/ \; )
