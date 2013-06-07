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
# Copyright 2012, 2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mod-cband
COMPONENT_VERSION=	0.9.6.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha256:c1437ad881a3a82d5a8c1a3adf4e48843ae12c8a926e7aede960f7122720647e
SF_PROJECT_NAME=	cband
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION.64 = ( sed -e 's/@DST_CLASS@/@DST_CLASS@ -Wl,-m64/' \
	$(@D)/Makefile.in > Makefile.in.mod; $(MV) Makefile.in.mod $(@D)/Makefile.in );

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D)); \
	$(COMPONENT_PRE_CONFIGURE_ACTION.$(BITS))

CONFIGURE_OPTIONS.32    +=      --with-apxs=$(ECPREFIX)/lib/apache/2.2/bin/apxs
CONFIGURE_OPTIONS.64    +=      --with-apxs=$(ECPREFIX)/lib/apache/2.2/bin/$(MACH64)/apxs

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	build
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.2/mods-available
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
	$(CP) $(BUILD_DIR_32)/src/.libs/mod_cband.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/
	$(CP) $(BUILD_DIR_64)/src/.libs/mod_cband.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

