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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mod_evasive
COMPONENT_FMRI=		web/server/apache-22/module/apache-evasive
COMPONENT_VERSION=	1.10.1
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	http://www.zdziarski.com/blog/?page_id=442
COMPONENT_SUMMARY=	mod_evasive provides in-line DOS filtering for Apache
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:07c45139aa313899484a900f0fc162b3e17eb4f60fe474d7f3dd6c9941e95667
COMPONENT_ARCHIVE_URL=	http://www.zdziarski.com/blog/wp-content/uploads/2010/02/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)
APACHE22_PATH=	$(ECPREFIX)/lib/apache/2.2

$(BUILD_DIR)/$(MACH32)/.built:  prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D)
	$(CP) $(SOURCE_DIR)/mod_evasive20.c $(@D)
	( cd $(@D) ; LTFLAGS="--tag=CC" $(APACHE22_PATH)/bin/apxs -L$(ECPREFIX)/lib -I$(ECPREFIX)/include -c mod_evasive20.c )
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH64)/.built:  prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D)
	$(CP) $(SOURCE_DIR)/mod_evasive20.c $(@D)
	( cd $(@D) ; LTFLAGS="--tag=CC" $(APACHE22_PATH)/bin/$(MACH64)/apxs -Wl,-m64 -L$(ECPREFIX)/lib/$(MACH64) -I$(ECPREFIX)/include -c mod_evasive20.c )
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH32)/.installed-$(MACH32):	build
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules
	$(CP) $(@D)/.libs/mod_evasive20.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH64)/.installed-$(MACH64):	build
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
	$(CP) $(@D)/.libs/mod_evasive20.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)/
	$(TOUCH) $@

$(BUILD_DIR)/.installed:	$(BUILD_DIR)/$(MACH32)/.installed-$(MACH32)	$(BUILD_DIR)/$(MACH64)/.installed-$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-available
	$(CP) files/evasive.conf $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-available
	$(CP) files/evasive.load $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-available
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(BUILD_DIR)/.installed

