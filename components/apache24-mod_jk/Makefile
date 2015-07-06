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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tomcat-connectors
COMPONENT_FMRI=		web/server/apache-24/module/apache-jk
COMPONENT_VERSION=	1.2.40
COMPONENT_LICENSE=	Apache v2
COMPONENT_PROJECT_URL=	"http://tomcat.apache.org/"
COMPONENT_SUMMARY=	mod_jk is the connector used to connect to the Tomcat servlet container with webservers
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)-src
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION)-src.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:895e347c4dff74049a848603fb29958e6cf429ea0fc708d514b3a8958236705d
COMPONENT_ARCHIVE_URL=	http://mirrors.ukfast.co.uk/sites/ftp.apache.org//tomcat/tomcat-connectors/jk/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

ifeq ($(SOLARIS_VERSION), 2.10)
CC_32 = /ec/bin/gcc
CC_64 = /ec/bin/gcc -m64
CC =    $(CC_$(BITS))
LINKER=ccs
COMPONENT_EXTRA_PATCH_ACTION=   ($(GPATCH) -d $(@D) $(GPATCH_FLAGS) < s10brandz-linking.patch)
endif

CONFIGURE_OPTIONS.32	+=	--with-apxs=$(USRDIR)/lib/apache/2.4/bin/apxs
CONFIGURE_OPTIONS.64	+=	--with-apxs=$(USRDIR)/lib/apache/2.4/bin/$(MACH64)/apxs

COMPONENT_PRE_CONFIGURE_ACTION = $(CLONEY) $(SOURCE_DIR)/native $(@D)
CONFIGURE_SCRIPT = $(SOURCE_DIR)/native/configure

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:        build
	$(MKDIR) $(PROTO_DIR)$(SYSCONFDIR)/apache/2.4/mods-available
	$(CP) $(COMPONENT_DIR)/files/jk.conf $(PROTO_DIR)$(SYSCONFDIR)/apache/2.4/mods-available
	$(CP) $(COMPONENT_DIR)/files/jk.load $(PROTO_DIR)$(SYSCONFDIR)/apache/2.4/mods-available
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/apache/2.4/modules/$(MACH64)
	$(CP) $(BUILD_DIR_32)/apache-2.0/mod_jk.so $(PROTO_DIR)$(USRDIR)/lib/apache/2.4/modules/
	$(CP) $(BUILD_DIR_64)/apache-2.0/mod_jk.so $(PROTO_DIR)$(USRDIR)/lib/apache/2.4/modules/$(MACH64)
	$(TOUCH) $@

install:        $(BUILD_DIR)/.installed
