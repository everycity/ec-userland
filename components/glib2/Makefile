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

COMPONENT_NAME=		glib
COMPONENT_FMRI=         library/glib2
COMPONENT_VERSION_MJR=	2.40
COMPONENT_VERSION=	$(COMPONENT_VERSION_MJR).0
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  "http://www.gtk.org/"
COMPONENT_SUMMARY=      GNOME core libraries
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:0d27f195966ecb1995dcce0754129fd66ebe820c7cd29200d264b02af1aa28b5
COMPONENT_ARCHIVE_URL=	http://ftp.gnome.org/pub/gnome/sources/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS.32+=	-march=i686
CFLAGS+=	$(CFLAGS.$(BITS))

CONFIGURE_OPTIONS+=	--with-libiconv=gnu

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(GSED) -i -e 's!/ec/bin/python!/ec/bin/python2.6!' $(PROTO_DIR)$(ECPREFIX)/bin/gdbus-codegen
	$(GSED) -i -e 's!/ec/bin/python!/ec/bin/python2.6!' $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/gdbus-codegen
	$(GSED) -i -e 's!/ec/bin/python!/ec/bin/python2.6!' $(PROTO_DIR)$(ECPREFIX)/bin/gtester-report
	$(GSED) -i -e 's!/ec/bin/python!/ec/bin/python2.6!' $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/gtester-report
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

#install:	$(PROTOUSRSHAREMAN3DIR) $(INSTALL_32_and_64)
#	$(CP) -f $(COMPONENT_DIR)/man3/*.3 $(PROTOUSRSHAREMAN3DIR)

# build does this always
#test: build
#	@cd $(BUILD_DIR_32); $(MAKE) check
#	@cd $(BUILD_DIR_64); $(MAKE) check

