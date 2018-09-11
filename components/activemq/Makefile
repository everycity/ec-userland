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
# Copyright 2011, Andrzej Szeszo
# Copyright 2018, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		activemq
COMPONENT_FMRI=		service/activemq
COMPONENT_VERSION=	5.15.6
COMPONENT_LICENSE=	APLv2
COMPONENT_PROJECT_URL=	"http://activemq.apache.org/"
COMPONENT_SUMMARY=	Apache ActiveMQ messaging provider
COMPONENT_SRC=		apache-$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-bin.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0d5493da5eea538f62f8858c1983572c706fab8443fcf8eedf26bb605a98c600
COMPONENT_ARCHIVE_URL=	http://archive.apache.org/dist/$(COMPONENT_NAME)/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS +=	$(BUILD_DIR)

$(BUILD_DIR)/%/.built:	$(SOURCE_DIR)/.prep
	$(MKDIR) -p $(@D)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/var/$(COMPONENT_NAME)
	for i in bin conf data docs examples lib webapps webapps-demo ; \
		do $(CP) -R $(SOURCE_DIR)/$$i $(PROTO_DIR)$(ECPREFIX)/var/$(COMPONENT_NAME)/ ; done
	for i in LICENSE NOTICE README.txt activemq-all-$(COMPONENT_VERSION).jar ; \
		do $(CP) $(SOURCE_DIR)/$$i $(PROTO_DIR)$(ECPREFIX)/var/$(COMPONENT_NAME)/ ; done
	$(RM) $(PROTO_DIR)$(ECPREFIX)/var/$(COMPONENT_NAME)/bin/activemq.~1~
	$(RM) -r $(PROTO_DIR)$(ECPREFIX)/var/$(COMPONENT_NAME)/bin/linux*
	$(RM) -r $(PROTO_DIR)$(ECPREFIX)/var/$(COMPONENT_NAME)/bin/macosx
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)
