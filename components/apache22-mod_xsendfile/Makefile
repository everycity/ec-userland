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

COMPONENT_NAME=		mod_xsendfile
COMPONENT_VERSION=	0.12

include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

APXS.32 = $(USRDIR)/lib/apache/2.2/bin/apxs
APXS.64 = $(USRDIR)/lib/apache/2.2/bin/$(MACH64)/apxs
APXS=$(APXS.$(BITS))

download prep::
configure:

$(BUILD_DIR)/%/.built: $(COMPONENT_DIR)/mod_xsendfile.c
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CP) $(COMPONENT_DIR)/mod_xsendfile.c $(@D)
	cd $(@D); $(APXS) -c -Wl,$(LD_BITS) mod_xsendfile.c
	$(TOUCH) $@

build: $(BUILD_32_and_64)

install: build
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/apache/2.2/modules/$(MACH64)
	$(CP) $(BUILD_DIR_32)/.libs/mod_xsendfile.so \
	    $(PROTO_DIR)$(USRDIR)/lib/apache/2.2/modules
	$(CP) $(BUILD_DIR_64)/.libs/mod_xsendfile.so \
	    $(PROTO_DIR)$(USRDIR)/lib/apache/2.2/modules/$(MACH64)
