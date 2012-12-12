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

COMPONENT_NAME=		libzen
COMPONENT_VERSION=	0.4.22
COMPONENT_SRC=		ZenLib
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:38df560ca9d79af8f7edea26baae0df9e7bf0006
COMPONENT_ARCHIVE_URL=	"http://kent.dl.sourceforge.net/project/zenlib/ZenLib%20-%20Sources/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)"

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D)/Project/GNU/Library; $(CONFIG_SHELL) autogen; )
COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR)/Source $(@D))
CONFIGURE_ENV +=	LIBS="$(LIBS) -lrt"
CONFIGURE_SCRIPT = $(SOURCE_DIR)/Project/GNU/Library/configure
CONFIGURE_OPTIONS += --disable-static --enable-shared

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include/ZenLib
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/Base64
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/Format/Html
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/Format/Http
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/HTTP_Client
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/TinyXml
	$(CP) $(SOURCE_DIR)/Source/ZenLib/*.h $(PROTO_DIR)$(ECPREFIX)/include/ZenLib
	$(CP) $(SOURCE_DIR)/Source/ZenLib/Base64/*.h $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/Base64
	$(CP) $(SOURCE_DIR)/Source/ZenLib/Format/Html/*.h $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/Format/Html
	$(CP) $(SOURCE_DIR)/Source/ZenLib/Format/Http/*.h $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/Format/Http
	$(CP) $(SOURCE_DIR)/Source/ZenLib/HTTP_Client/*.h $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/HTTP_Client
	$(CP) $(SOURCE_DIR)/Source/ZenLib/TinyXml/*.h $(PROTO_DIR)$(ECPREFIX)/include/ZenLib/TinyXml

	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/pkgconfig
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	sed -e 's|Version: |Version: $(COMPONENT_VERSION)|g' $(BUILD_DIR)/$(MACH32)/libzen.pc > \
	    $(PROTO_DIR)$(ECPREFIX)/lib/pkgconfig/libzen.pc
	sed -e 's|Version: |Version: $(COMPONENT_VERSION)|g' $(BUILD_DIR)/$(MACH64)/libzen.pc > \
	    $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig/libzen.pc

	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)

	echo "#!/bin/sh" >$(PROTO_DIR)$(ECPREFIX)/bin/libzen-config
	cat $(BUILD_DIR)/$(MACH32)/libzen-config | sed s%\^echo.*\-lzen%echo\ \-lzen% | \
	    sed s%\^echo.*\libzen\.a%echo\ $(ECPREFIX)/lib/libzen.a% >> $(PROTO_DIR)$(ECPREFIX)/bin/libzen-config

	echo "#!/bin/sh" >$(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/libzen-config
	cat $(BUILD_DIR)/$(MACH32)/libzen-config | sed s%\^echo.*\-lzen%echo\ \-lzen% | \
	    sed s%\^echo.*\libzen\.a%echo\ $(ECPREFIX)/lib/$(MACH64)/libzen.a% >> \
	    $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/libzen-config

