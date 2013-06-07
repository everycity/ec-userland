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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		geoip-db-city
COMPONENT_VERSION=	20111006
COMPONENT_FILE=		GeoLiteCity-$(COMPONENT_VERSION).dat
COMPONENT_ARCHIVE=      $(COMPONENT_FILE).gz
COMPONENT_ARCHIVE_HASH=	sha256:931ebf653b525c678d86dc0024ede47360f41394cb0847c2c1a0017245b4a906
COMPONENT_ARCHIVE_URL=	$(EC_ARCHIVE)/$(COMPONENT_ARCHIVE)

include ../../make-rules/ips.mk

CLEAN_PATHS +=  $(BUILD_DIR) $(COMPONENT_FILE)

IPS_COMPONENT_VERSION=	2011.10.6

GEOIP_DIR =	$(PROTO_DIR)$(ECPREFIX)/share/GeoIP

download::
	$(WS_TOOLS)/userland-fetch --url $(COMPONENT_ARCHIVE_URL) --hash $(COMPONENT_ARCHIVE_HASH)
	gunzip -f $(COMPONENT_ARCHIVE)

$(BUILD_DIR)/%/.built:	prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D) $(GEOIP_DIR)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(CP) $(COMPONENT_FILE) $(GEOIP_DIR)/GeoIPCity.dat
	$(TOUCH) $@

prep:	download

build:		$(BUILD_32)

install:	$(INSTALL_32)

clean::
	$(RM) -r $(CLEAN_PATHS)
