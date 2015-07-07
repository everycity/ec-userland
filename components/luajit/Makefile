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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		LuaJIT
COMPONENT_FMRI=         runtime/luajit
COMPONENT_VERSION=      2.0.3
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://luajit.org/"
COMPONENT_SUMMARY=	A Just-In-Time Compiler for Lua.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:55be6cb2d101ed38acca32c5b1f99ae345904b365b642203194c585d27bebd79
COMPONENT_ARCHIVE_URL=	http://luajit.org/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ARGS_32+=	CFLAGS="-m32 -march=i686" LDFLAGS="-m32 -L$(USRDIR)/lib -R$(USRDIR)/lib"
COMPONENT_BUILD_ARGS_64+=	BINDIR=bin/$(MACH64) MULTILIB=lib/$(MACH64) CFLAGS="-m64" LDFLAGS="-m64 -L$(USRDIR)/lib/$(MACH64) -R$(USRDIR)/lib/$(MACH64)"
COMPONENT_BUILD_ARGS+=		PREFIX=$(USRDIR) $(COMPONENT_BUILD_ARGS_$(BITS))
COMPONENT_INSTALL_ARGS_64+=	BINDIR=bin/$(MACH64) MULTILIB=lib/$(MACH64)
COMPONENT_INSTALL_ARGS+=	PREFIX=$(USRDIR) $(COMPONENT_INSTALL_ARGS_$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

