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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

# this component builds only 'filebeat' of 'beats' distribution

COMPONENT_NAME=		beats
COMPONENT_FMRI=		network/beats
COMPONENT_VERSION=      6.2.1
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  "https://www.elastic.co/products/beats"
COMPONENT_SUMMARY=	Data Shippers for Elasticsearch
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:7fc935b65469acc728653c89ef7b8541db4c5dafdbb1459822f0c215d58d30e6
COMPONENT_ARCHIVE_URL=	https://codeload.github.com/elastic/beats/tar.gz/v${COMPONENT_VERSION}


include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)

COMPONENT_BUILD_ENV+="GOPATH=$(BUILD_DIR)/$(COMPONENT_NAME)"

# build the configured source
$(BUILD_DIR)/$(COMPONENT_NAME)/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)/src/github.com/elastic/beats
	$(CLONEY) $(SOURCE_DIR) $(@D)/src/github.com/elastic/beats
	(cd $(@D)/src/github.com/elastic/beats/filebeat; \
	  $(ENV) $(COMPONENT_BUILD_ENV) go get .; \
	  $(ENV) $(COMPONENT_BUILD_ENV) go install)
	(cd $(@D)/src/github.com/elastic/beats/packetbeat; \
	  $(ENV) $(COMPONENT_BUILD_ENV) go get .; \
	  $(ENV) $(COMPONENT_BUILD_ENV) go install)
# topbeat does not build on smartos :(
#	(cd $(@D)/src/github.com/elastic/beats/topbeat; \
#	  $(ENV) $(COMPONENT_BUILD_ENV) go get .; \
#	  $(ENV) $(COMPONENT_BUILD_ENV) go build)
	$(TOUCH) $@

# install the built source into a prototype area
$(BUILD_DIR)/$(COMPONENT_NAME)/.installed:	$(BUILD_DIR)/$(COMPONENT_NAME)/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/filebeat
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/packetbeat
	$(MKDIR) $(PROTO_DIR)/var/svc/manifest/site
	$(CP) $(COMPONENT_DIR)/files/filebeat-smf.xml $(PROTO_DIR)/var/svc/manifest/site/filebeat.xml
	$(CP) $(COMPONENT_DIR)/files/packetbeat-smf.xml $(PROTO_DIR)/var/svc/manifest/site/packetbeat.xml
	$(CP) $(@D)/bin/filebeat $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(CP) $(@D)/bin/packetbeat $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(CP) $(SOURCE_DIR)/filebeat/filebeat.yml $(PROTO_DIR)$(ECPREFIX)/etc/filebeat
	$(CP) $(SOURCE_DIR)/packetbeat/packetbeat.yml $(PROTO_DIR)$(ECPREFIX)/etc/packetbeat
	$(SYMLINK) $(MACH64)/filebeat $(PROTO_DIR)$(ECPREFIX)/bin/filebeat
	$(SYMLINK) $(MACH64)/packetbeat $(PROTO_DIR)$(ECPREFIX)/bin/packetbeat
	$(TOUCH) $@

build:		$(BUILD_DIR)/$(COMPONENT_NAME)/.built

install:	$(BUILD_DIR)/$(COMPONENT_NAME)/.installed

