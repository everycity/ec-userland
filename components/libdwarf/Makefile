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

COMPONENT_NAME=		dwarf
COMPONENT_FMRI=         library/libdwarf
COMPONENT_VERSION=      20150310
COMPONENT_LICENSE=      LGPLv2.1/GPLv2
COMPONENT_PROJECT_URL=  "http://www.prevanders.net/dwarf.html"
COMPONENT_SUMMARY=	libdwarf is a library and a set of tools for reading and writing DWARF2 and later debugging information
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	lib$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:f91e0c7517261362e033652f4bf688ef8f6241d190cb480f5c2ad6278750d5ec
COMPONENT_ARCHIVE_URL=	http://www.prevanders.net/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS+=	$(CC_PIC)
CXXFLAGS+=	$(CC_PIC)
LIBS+=	-lelf

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_ENV+=		LIBS="$(LIBS)"
#COMPONENT_BUILD_ENV+=	dwfpic="$(gcc_PIC)"
COMPONENT_BUILD_ENV+=	CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)"
# dwfpic="$(gcc_PIC)"
COMPONENT_BUILD_TARGETS+=	all

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(BUILD_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(CP) $(BUILD_DIR_32)/dwarfdump/dwarfdump $(PROTO_DIR)$(ECPREFIX)/bin
	$(CP) $(BUILD_DIR_64)/dwarfdump/dwarfdump $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(CP) $(BUILD_DIR_32)/dwarfdump/dwarfdump.conf $(PROTO_DIR)$(ECPREFIX)/lib
	$(CP) $(BUILD_DIR_32)/dwarfdump/dwarfdump.conf $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(CP) $(BUILD_DIR_32)/libdwarf/libdwarf.h $(PROTO_DIR)$(ECPREFIX)/include
	$(CP) $(BUILD_DIR_32)/libdwarf/libdwarf.a $(PROTO_DIR)$(ECPREFIX)/lib
	$(CP) $(BUILD_DIR_32)/libdwarf/libdwarf.so $(PROTO_DIR)$(ECPREFIX)/lib
	$(CP) $(BUILD_DIR_64)/libdwarf/libdwarf.a $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(CP) $(BUILD_DIR_64)/libdwarf/libdwarf.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

