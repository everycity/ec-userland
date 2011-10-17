#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		geoip-db-country
COMPONENT_VERSION=	20111006
COMPONENT_FILE=		GeoIP-$(COMPONENT_VERSION).dat
COMPONENT_ARCHIVE=      $(COMPONENT_FILE).gz
COMPONENT_ARCHIVE_URL=	http://svn.everycity.co.uk/public/solaris/misc/$(COMPONENT_ARCHIVE)

include ../../make-rules/ips.mk

CLEAN_PATHS +=  $(BUILD_DIR)

IPS_COMPONENT_VERSION=	2011.10.6

GEOIP_DIR =	$(PROTO_DIR)/$(ECPREFIX)/share/GeoIP

download::
	$(WS_TOOLS)/userland-fetch --url $(COMPONENT_ARCHIVE_URL)
	gunzip $(COMPONENT_ARCHIVE)

$(BUILD_DIR)/%/.built: 
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D) $(GEOIP_DIR)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(CP) $(COMPONENT_FILE) $(GEOIP_DIR)/GeoIP.dat
	$(TOUCH) $@

prep:

build:		$(BUILD_32)

install:	$(INSTALL_32)

clean::
	$(RM) -r $(CLEAN_PATHS)
