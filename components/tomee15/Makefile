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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tomee
COMPONENT_VERSION=	1.5.0
OPENEJB_VERSION=	4.5.0
COMPONENT_SRC=		apache-tomee-webprofile-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	apache-tomee-$(COMPONENT_VERSION)-webprofile.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:a97c47329eaf720ab9fb3374a76fee0d87fcc1b48557061208398afec2286a0a
COMPONENT_ARCHIVE_URL=	http://mirrors.ukfast.co.uk/sites/ftp.apache.org/openejb/openejb-$(OPENEJB_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

$(BUILD_DIR)/%/.built:	$(SOURCE_DIR)/.prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	[ -d $(PROTO_DIR) ] || $(MKDIR) $(PROTO_DIR)
	( for i in etc/tomee15 lib/tomee15 share/doc/tomee15 var/tomee15/common/classes \
		var/tomee15/server/classes var/tomee15/shared/classes \
		var/tomee15/temp var/tomee15/webapps var/tomee15/work var/log/tomee15 ; \
		do $(MKDIR) -p $(PROTO_DIR)/$(ECPREFIX)/$$i ; done )
	( for i in bin lib webapps endorsed ; \
		do $(CP) -R $(SOURCE_DIR)/$$i $(PROTO_DIR)/$(ECPREFIX)/lib/tomee15/ ; done )
	( for i in LICENSE NOTICE RELEASE-NOTES RUNNING.txt ; \
		do $(CP) $(SOURCE_DIR)/$$i $(PROTO_DIR)/$(ECPREFIX)/share/doc/tomee15/ ; done )
	( for i in catalina.policy catalina.properties context.xml logging.properties server.xml \
		system.properties tomcat-users.xml tomee.xml web.xml ; \
		do $(CP) $(SOURCE_DIR)/conf/$$i $(PROTO_DIR)/$(ECPREFIX)/etc/tomee15/ ; done )
	$(TOUCH) $@

build:          $(BUILD_32)

install:        $(INSTALL_32)

