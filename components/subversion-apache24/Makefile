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

COMPONENT_NAME=		subversion
COMPONENT_FMRI=		web/server/apache-24/module/apache-subversion
COMPONENT_VERSION=	1.8.14
COMPONENT_LICENSE=	CollabNetSVN
COMPONENT_PROJECT_URL=	"http://subversion.apache.org"
COMPONENT_SUMMARY=	The Subversion Source Control Management System Apache Module (Apache 2.4)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:7f3883cdfcad4174e06dd94d6e3e8ec91856823268eebe60c924be76f5229a1f
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=		-lintl -liconv

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--disable-mod-activation
CONFIGURE_OPTIONS.32+=	--with-apr=$(ECPREFIX)/bin/apr-1-config
CONFIGURE_OPTIONS.64+=	--with-apr=$(ECPREFIX)/bin/$(MACH64)/apr-1-config
CONFIGURE_OPTIONS.32+=	--with-apr-util=$(ECPREFIX)/bin/apu-1-config
CONFIGURE_OPTIONS.64+=	--with-apr-util=$(ECPREFIX)/bin/$(MACH64)/apu-1-config
CONFIGURE_OPTIONS.32+=	--with-swig=$(ECPREFIX)/bin/swig
CONFIGURE_OPTIONS.64+=	--with-swig=$(ECPREFIX)/bin/$(MACH64)/swig
CONFIGURE_OPTIONS.32+=	--with-apxs=$(ECPREFIX)/lib/apache/2.4/bin/apxs
CONFIGURE_OPTIONS.64+=	--with-apxs=$(ECPREFIX)/lib/apache/2.4/bin/$(MACH64)/apxs
CONFIGURE_OPTIONS.32+=	--with-apache-libexecdir=$(ECPREFIX)/lib/apache/2.4/modules
CONFIGURE_OPTIONS.64+=	--with-apache-libexecdir=$(ECPREFIX)/lib/apache/2.4/modules/$(MACH64)
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))
CONFIGURE_OPTIONS+=	JAVA_HOME="$(ECPREFIX)/java"

COMPONENT_BUILD_ENV+= EXTRA_CPPFLAGS=-D__EXTENSIONS__

COMPONENT_PRE_CONFIGURE_ACTION+=	($(CP) -R $(SOURCE_DIR)/* $(@D)/)
CONFIGURE_SCRIPT=	$(@D)/configure

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.4/mods-available
	$(CP) $(COMPONENT_DIR)/files/subversion.conf $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.4/mods-available
	$(CP) $(COMPONENT_DIR)/files/subversion.load $(PROTO_DIR)$(ECPREFIX)/etc/apache/2.4/mods-available
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

