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
# Copyright 2015, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lua
COMPONENT_FMRI=		developer/lua-51
COMPONENT_MJR_VERSION=	5.1
COMPONENT_MNR_VERSION=	5
COMPONENT_VERSION=	$(COMPONENT_MJR_VERSION).$(COMPONENT_MNR_VERSION)
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://www.lua.org/"
COMPONENT_SUMMARY=	Lua is a powerful, fast, lightweight, embeddable scripting language.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:2640fc56a795f29d28ef15e13c34a47e223960b0240e8cb0a82d9b0738695333
COMPONENT_ARCHIVE_URL=	http://www.lua.org/ftp/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ARGS=   solaris
COMPONENT_BUILD_ENV+=	MYCFLAGS="$(CFLAGS) $(CC_PIC)"
COMPONENT_BUILD_ENV+=	MYLDFLAGS="$(LDFLAGS) $(CC_PIC) -lm"
COMPONENT_BUILD_ENV+=	MYLIBS="$(CC_BITS)"
COMPONENT_BUILD_ENV+=	LUA_VER="$(COMPONENT_MJR_VERSION)"

build:		$(BUILD_32_and_64)

# Update this list from src/Makefile in the lua source
TO_BIN= lua luac
TO_INC= lua.h luaconf.h lualib.h lauxlib.h ../etc/lua.hpp
TO_MAN= lua.1 luac.1
# Don't update this line however
TO_LIB= liblua-$(COMPONENT_MJR_VERSION).so

$(BUILD_DIR)/.installed:	$(BUILD_32_and_64)
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/lib/pkgconfig
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/include
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/share/man/man1
	( cd $(BUILD_DIR_32)/src && $(CP) $(TO_BIN) $(PROTO_DIR)$(ECPREFIX)/bin/ && \
	$(CP) $(TO_INC) $(PROTO_DIR)$(ECPREFIX)/include/ && \
	$(CP) $(TO_LIB) $(PROTO_DIR)$(ECPREFIX)/lib/)
	( cd $(BUILD_DIR_32)/doc && $(CP) $(TO_MAN) $(PROTO_DIR)$(ECPREFIX)/share/man/man1/ )
	( cd $(BUILD_DIR_64)/src && $(CP) $(TO_LIB) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/ && \
	$(CP) $(TO_BIN) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/)
	cat $(COMPONENT_DIR)/files/lua.pc | sed -e s%LUA_VER%$(COMPONENT_VERSION)% -e \
		s%LUA_LIBDIR%$(ECPREFIX)/lib% > $(PROTO_DIR)$(ECPREFIX)/lib/pkgconfig/lua.pc
	cat $(COMPONENT_DIR)/files/lua.pc | sed -e s%LUA_VER%$(COMPONENT_VERSION)% -e \
		s%LUA_LIBDIR%$(ECPREFIX)/lib/$(MACH64)% > $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig/lua.pc

install:	$(BUILD_DIR)/.installed
