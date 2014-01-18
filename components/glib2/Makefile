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
COMPONENT_VERSION=	2.39.3
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  "http://www.gtk.org/"
COMPONENT_SUMMARY=      GNOME core libraries
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:d9fa6c9aa645a5e688a3bb29013bb83801b19ee767d99e33ff52e004e1cc5fc8
COMPONENT_ARCHIVE_URL=	http://ftp.gnome.org/pub/gnome/sources/$(COMPONENT_NAME)/2.39/$(COMPONENT_ARCHIVE)

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

