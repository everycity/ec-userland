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
COMPONENT_VERSION=	1.8.13
COMPONENT_LICENSE=	CollabNetSVN
COMPONENT_PROJECT_URL=	"http://subversion.apache.org"
COMPONENT_SUMMARY=	The Subversion Source Control Management System Apache Module (Apache 2.4)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:1099cc68840753b48aedb3a27ebd1e2afbcc84ddb871412e5d500e843d607579
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = \
	( cd $(@D) \
	&& $(ENV) $(CONFIGURE_ENV) ./autogen.sh )

COMPONENT_PRE_CONFIGURE_ACTION = \
	$(CLONEY) $(SOURCE_DIR) $(@D)

CPPFLAGS += -D__EXTENSIONS__
CXXFLAGS += $(CC_PIC)
CXXFLAGS += -D_REENTRANT -DNDEBUG -DSOLARIS
CFLAGS.32 += $(CPP_LARGEFILES)

LDFLAGS += $(CC_BITS)

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--disable-experimental-libtool
CONFIGURE_OPTIONS+=	--disable-mod-activation
CONFIGURE_OPTIONS.32+=	--with-apr=$(USRDIR)/bin/apr-1-config
CONFIGURE_OPTIONS.64+=	--with-apr=$(USRDIR)/bin/$(MACH64)/apr-1-config
CONFIGURE_OPTIONS.32+=	--with-apr-util=$(USRDIR)/bin/apu-1-config
CONFIGURE_OPTIONS.64+=	--with-apr-util=$(USRDIR)/bin/$(MACH64)/apu-1-config
CONFIGURE_OPTIONS.32+=	--with-swig=$(USRDIR)/bin/swig
CONFIGURE_OPTIONS.64+=	--with-swig=$(USRDIR)/bin/$(MACH64)/swig
CONFIGURE_OPTIONS.32+=	--with-apxs=$(USRDIR)/lib/apache/2.4/bin/apxs
CONFIGURE_OPTIONS.64+=	--with-apxs=$(USRDIR)/lib/apache/2.4/bin/$(MACH64)/apxs
CONFIGURE_OPTIONS.32+=	--with-apache-libexecdir=$(USRDIR)/lib/apache/2.4/modules
CONFIGURE_OPTIONS.64+=	--with-apache-libexecdir=$(USRDIR)/lib/apache/2.4/modules/$(MACH64)
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))
CONFIGURE_OPTIONS+=	JAVA_HOME="$(USRDIR)/java"

#COMPONENT_BUILD_ENV+= EXTRA_CPPFLAGS=-D__EXTENSIONS__

#COMPONENT_PRE_CONFIGURE_ACTION+=	($(CP) -R $(SOURCE_DIR)/* $(@D)/)
#CONFIGURE_SCRIPT=	$(@D)/configure

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/etc/apache/2.4/mods-available
	$(CP) $(COMPONENT_DIR)/files/subversion.conf $(PROTO_DIR)$(USRDIR)/etc/apache/2.4/mods-available
	$(CP) $(COMPONENT_DIR)/files/subversion.load $(PROTO_DIR)$(USRDIR)/etc/apache/2.4/mods-available
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

