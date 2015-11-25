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

COMPONENT_NAME=		modsecurity-apache
COMPONENT_FMRI=		web/server/apache-24/module/apache-security
COMPONENT_VERSION=	2.9.0
COMPONENT_LICENSE=	Apache
COMPONENT_PROJECT_URL=	http://www.modsecurity.org/
COMPONENT_SUMMARY=	mod_security provides in-line security filtering for Apache
COMPONENT_SRC=		modsecurity-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e2bbf789966c1f80094d88d9085a81bde082b2054f8e38e0db571ca49208f434
COMPONENT_ARCHIVE_URL=	http://www.modsecurity.org/tarball/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-llua

CONFIGURE_OPTIONS.32+=	--with-apxs=$(ECPREFIX)/lib/apache/2.4/bin/apxs
CONFIGURE_OPTIONS.64+=	--with-apxs=$(ECPREFIX)/lib/apache/2.4/bin/$(MACH64)/apxs
CONFIGURE_OPTIONS+=	--with-pcre=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-curl=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-libxml=$(ECPREFIX)
CONFIGURE_OPTIONS.32+=	--with-apr=$(ECPREFIX)/bin/apr-1-config
CONFIGURE_OPTIONS.64+=	--with-apr=$(ECPREFIX)/bin/$(MACH64)/apr-1-config
CONFIGURE_OPTIONS.32+=	--with-apu=$(ECPREFIX)/bin/apu-1-config
CONFIGURE_OPTIONS.64+=	--with-apu=$(ECPREFIX)/bin/$(MACH64)/apu-1-config
CONFIGURE_OPTIONS+=	--with-lua

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:        build
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.4/mods-available
	$(CP) $(COMPONENT_DIR)/files/security.conf $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.4/mods-available
	$(CP) $(COMPONENT_DIR)/files/security.load $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.4/mods-available
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.4/modules/$(MACH64)
	$(CP) $(BUILD_DIR_32)/apache2/.libs/mod_security2.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.4/modules/
	$(CP) $(BUILD_DIR_64)/apache2/.libs/mod_security2.so $(PROTO_DIR)$(ECPREFIX)/lib/apache/2.4/modules/$(MACH64)
	$(TOUCH) $@

install:        $(BUILD_DIR)/.installed

