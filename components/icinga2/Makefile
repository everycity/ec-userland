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

COMPONENT_NAME=		icinga2
COMPONENT_VERSION=	2.4.1
COMPONENT_FMRI=		monitoring/icinga/icinga2
COMPONENT_SUMMARY=	Icinga2 Monitoring System
COMPONENT_LICENSE=	GPLv2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)-bin
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION)-bin.tar.bz2
COMPONENT_ARCHIVE_URL=	http://l1.everycity.co.uk/~aszeszo/smartos-icinga2-build/$(COMPONENT_ARCHIVE)
#COMPONENT_ARCHIVE_HASH=	sha256:
COMPONENT_PROJECT_URL=	https://www.icinga.org/icinga/icinga-2/

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

$(BUILD_DIR)/%/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	[[ -d $(PROTO_DIR) ]] || $(MKDIR) $(PROTO_DIR)
	rsync -aH --delete --exclude "/\.*" $(SOURCE_DIR)/ $(PROTO_DIR)/
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)
