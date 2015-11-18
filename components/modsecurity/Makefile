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

COMPONENT_NAME=		modsecurity
#COMPONENT_FMRI=		web/server/nginx/module/nginx-security
COMPONENT_VERSION=	2.9.0
COMPONENT_LICENSE=	Apache
COMPONENT_PROJECT_URL=	http://www.modsecurity.org/
COMPONENT_SUMMARY=	mod_security provides in-line security filtering
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e2bbf789966c1f80094d88d9085a81bde082b2054f8e38e0db571ca49208f434
COMPONENT_ARCHIVE_URL=	http://www.modsecurity.org/tarball/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-llua -lcurl

CONFIGURE_OPTIONS.32+=	--with-apxs=$(ECPREFIX)/lib/apache/2.2/bin/apxs
CONFIGURE_OPTIONS.64+=	--with-apxs=$(ECPREFIX)/lib/apache/2.2/bin/$(MACH64)/apxs
CONFIGURE_OPTIONS+=	--enable-standalone-module
CONFIGURE_OPTIONS+=	--disable-mlogc
CONFIGURE_OPTIONS+=	--with-pcre=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-curl=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-libxml=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-apr=$(ECPREFIX)/bin/apr-1-config
CONFIGURE_OPTIONS+=	--with-apu=$(ECPREFIX)/bin/apu-1-config

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

build:		$(BUILD_32_and_64)

install:        $(INSTALL_32_and_64)

