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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=         smartos-ps
COMPONENT_VERSION=      1.0

ifneq ($(SOLARIS_VERSION), 2.10)
PUBLISH_STAMP=
endif

include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

PROTO_BIN_DIR=  $(PROTO_DIR)$(ECPREFIX)/bin

$(BUILD_DIR)/%/.built: 
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D) $(PROTO_BIN_DIR)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(CP) $(COMPONENT_DIR)/files/smartos-ps $(PROTO_BIN_DIR)/ps
	$(TOUCH) $@

download:

prep:

build:		build_$(SOLARIS_VERSION)

build_2.10:	$(BUILD_32)

build_2.11:
	@echo "Not available."

install:	install_$(SOLARIS_VERSION)	

install_2.10:	$(INSTALL_32)

install_2.11:
	@echo "Not available."

clean::
	$(RM) -r $(CLEAN_PATHS)

