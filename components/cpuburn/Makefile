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

COMPONENT_NAME=		cpuburn
COMPONENT_VERSION=	1.4
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).orig.tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:291e163d17ce528fd8301f821babed74d9caffaf
COMPONENT_ARCHIVE_URL=	https://launchpad.net/ubuntu/lucid/+source/cpuburn/1.4-39/+files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

# install the built source into a prototype area
$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin ; \
	$(CP) $(@D)/{burnP5,burnP6,burnK6,burnK7,burnBX,burnMMX} \
	$(PROTO_DIR)$(ECPREFIX)/bin/ ; \
	$(TOUCH) $@

build:          $(BUILD_32)

install:        $(INSTALL_32)


