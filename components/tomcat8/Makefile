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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tomcat
COMPONENT_VERSION=	8.0.53
COMPONENT_FMRI=         web/java-servlet/tomcat8
COMPONENT_LICENSE=      Apache v2.0
COMPONENT_SUMMARY=      Tomcat Servlet/JSP Container
COMPONENT_PROJECT_URL=	$(PROJECT_APACHE)
COMPONENT_SRC=		apache-tomcat-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	apache-tomcat-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:19a047c4425c4ea796215d397b7caeda958c764981624ea5c4f763d98d2db7fa
COMPONENT_ARCHIVE_URL=	http://mirror.ox.ac.uk/sites/rsync.apache.org/tomcat/tomcat-8/v$(COMPONENT_VERSION)/bin/$(COMPONENT_ARCHIVE)
COMPONENT_JMX_URL=	http://mirror.ox.ac.uk/sites/rsync.apache.org/tomcat/tomcat-8/v$(COMPONENT_VERSION)/bin/extras/catalina-jmx-remote.jar

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

$(BUILD_DIR)/%/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	[ -d $(PROTO_DIR) ] || $(MKDIR) $(PROTO_DIR)
	( for i in etc/tomcat8 lib/tomcat8 share/doc/tomcat8 var/tomcat8/common/classes \
		var/tomcat8/server/classes var/tomcat8/shared/classes \
		var/tomcat8/temp var/tomcat8/webapps var/tomcat8/work var/log/tomcat8 ; \
		do $(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/$$i ; done )
	( for i in bin lib webapps ; \
		do $(CP) -R $(SOURCE_DIR)/$$i $(PROTO_DIR)$(ECPREFIX)/lib/tomcat8/ ; done )
	( for i in LICENSE NOTICE RELEASE-NOTES RUNNING.txt ; \
		do $(CP) $(SOURCE_DIR)/$$i $(PROTO_DIR)$(ECPREFIX)/share/doc/tomcat8/ ; done )
	( for i in catalina.policy catalina.properties context.xml logging.properties server.xml \
		tomcat-users.xml web.xml ; \
		do $(CP) $(SOURCE_DIR)/conf/$$i $(PROTO_DIR)$(ECPREFIX)/etc/tomcat8/ ; done )
	wget -O $(PROTO_DIR)$(ECPREFIX)/lib/tomcat8/lib/catalina-jmx-remote.jar $(COMPONENT_JMX_URL)
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)

