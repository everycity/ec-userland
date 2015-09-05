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

COMPONENT_NAME=		mod_rpaf
COMPONENT_FMRI=	 web/server/apache-22/module/apache-rpaf
COMPONENT_VERSION=      0.8.4
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  "https://github.com/gnif/mod_rpaf"
COMPONENT_SUMMARY=	reverse proxy add forward module for Apache
COMPONENT_SRC=		mod_rpaf-stable
COMPONENT_ARCHIVE=	stable.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:940a12fa0b536c5d90956bac2a782f3c2429d6ac7cd1ec8bff7d8e0ba5a6e647
COMPONENT_ARCHIVE_URL=	https://github.com/gnif/mod_rpaf/archive/stable.tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=   $(BUILD_DIR)
APACHE22_PATH=  $(USRDIR)/lib/apache/2.2

$(BUILD_DIR)/$(MACH32)/.built:  prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D)
	$(CP) $(SOURCE_DIR)/mod_rpaf.c $(@D)
	( cd $(@D) ; LTFLAGS="--tag=CC" $(APACHE22_PATH)/bin/apxs -L$(USRDIR)/lib -I$(USRDIR)/include -c mod_rpaf.c )
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH64)/.built:  prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D)
	$(CP) $(SOURCE_DIR)/mod_rpaf.c $(@D)
	( cd $(@D) ; LTFLAGS="--tag=CC" $(APACHE22_PATH)/bin/$(MACH64)/apxs -Wl,-m64 -L$(USRDIR)/lib/$(MACH64) -I$(USRDIR)/include -c mod_rpaf.c )
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH32)/.installed-$(MACH32):    build
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/apache/2.2/modules
	$(CP) $(@D)/.libs/mod_rpaf.so $(PROTO_DIR)$(USRDIR)/lib/apache/2.2/modules
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH64)/.installed-$(MACH64):    build
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/apache/2.2/modules/$(MACH64)
	$(CP) $(@D)/.libs/mod_rpaf.so $(PROTO_DIR)$(USRDIR)/lib/apache/2.2/modules/$(MACH64)
	$(TOUCH) $@

$(BUILD_DIR)/.installed:	$(BUILD_DIR)/$(MACH32)/.installed-$(MACH32)     $(BUILD_DIR)/$(MACH64)/.installed-$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/etc/apache/2.2/mods-available
	$(CP) files/rpaf.conf $(PROTO_DIR)$(USRDIR)/etc/apache/2.2/mods-available
	$(CP) files/rpaf.load $(PROTO_DIR)$(USRDIR)/etc/apache/2.2/mods-available
	$(TOUCH) $@

build:	  $(BUILD_32_and_64)

install:	$(BUILD_DIR)/.installed

