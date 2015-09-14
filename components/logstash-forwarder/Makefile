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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		logstash-forwarder
COMPONENT_FMRI=	 service/logstash-forwarder
COMPONENT_VERSION=      2015.3.23
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  "https://github.com/elasticsearch/logstash-forwarder"
COMPONENT_SUMMARY=	An experiment to cut logs in preparation for processing elsewhere
COMPONENT_SRC=		$(COMPONENT_NAME)-de79786bbb
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ce41a9f2ed5216a8f78c8cde8068b842a5a6d0d666c4d745659663d79599909f
COMPONENT_ARCHIVE_URL=	https://codeload.github.com/elasticsearch/logstash-forwarder/tar.gz/de79786bbb

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)

# build the configured source
$(BUILD_DIR)/$(COMPONENT_NAME)/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CLONEY) $(SOURCE_DIR) $(@D)
	(cd $(@D) ; $(ENV) go build)
	$(TOUCH) $@

# install the built source into a prototype area
$(BUILD_DIR)/$(COMPONENT_NAME)/.installed:	$(BUILD_DIR)/$(COMPONENT_NAME)/.built
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/bin
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/etc/logstash-forwarder
	$(CP) $(@D)/$(COMPONENT_NAME) $(PROTO_DIR)$(USRDIR)/bin
	$(CP) $(@D)/logstash-forwarder.conf.example $(PROTO_DIR)$(USRDIR)/etc/logstash-forwarder/logstash-forwarder.conf
	$(TOUCH) $@

build:		$(BUILD_DIR)/$(COMPONENT_NAME)/.built

install:	$(BUILD_DIR)/$(COMPONENT_NAME)/.installed
