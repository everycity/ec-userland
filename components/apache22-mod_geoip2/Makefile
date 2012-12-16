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

COMPONENT_NAME=		mod_geoip2
COMPONENT_VERSION=	1.2.7
COMPONENT_SRC=		$(COMPONENT_NAME)_$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:0b23848d459415d979171efbb635e67568ae2816
COMPONENT_ARCHIVE_URL=	http://geolite.maxmind.com/download/geoip/api/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS+=	$(BUILD_DIR)
APACHE22_PATH=	$(ECPREFIX)/lib/apache/2.2

$(BUILD_DIR)/$(MACH32)/.built:  prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D)
	$(CP) $(SOURCE_DIR)/mod_geoip.c $(@D)
	( cd $(@D) ; LTFLAGS="--tag=CC" $(APACHE22_PATH)/bin/apxs -L$(ECPREFIX)/lib -I$(ECPREFIX)/include -lGeoIP -c mod_geoip.c )
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH64)/.built:  prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D)
	$(CP) $(SOURCE_DIR)/mod_geoip.c $(@D)
	( cd $(@D) ; LTFLAGS="--tag=CC" $(APACHE22_PATH)/bin/$(MACH64)/apxs -Wl,-m64 -L$(ECPREFIX)/lib/$(MACH64) -I$(ECPREFIX)/include -lGeoIP -c mod_geoip.c )
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH32)/.installed-$(MACH32):	build
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules
	$(CP) $(@D)/.libs/mod_geoip.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH64)/.installed-$(MACH64):	build
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
	$(CP) $(@D)/.libs/mod_geoip.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
	$(TOUCH) $@

$(BUILD_DIR)/.installed:	$(BUILD_DIR)/$(MACH32)/.installed-$(MACH32)	$(BUILD_DIR)/$(MACH64)/.installed-$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-available
	$(CP) files/geoip2.conf $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-available
	$(CP) files/geoip2.load $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-available
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(BUILD_DIR)/.installed
