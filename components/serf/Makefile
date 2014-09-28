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

COMPONENT_NAME=		serf
COMPONENT_FMRI=         library/serf
COMPONENT_VERSION=      1.3.3
COMPONENT_LICENSE=      Apachev2
COMPONENT_PROJECT_URL=  "http://code.google.com/p/serf/"
COMPONENT_SUMMARY=	A high performance C-based HTTP client library built upon the Apache Portable Runtime (APR) library.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:02eae04176296347be3c32b0da8d8610064f4a9f40065fb1cefbe5b656f8ad2b
COMPONENT_ARCHIVE_URL=	http://serf.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CPPFLAGS += -D__EXTENSIONS__

GMAKE=scons

COMPONENT_BUILD_ARGS += CC="$(CC)"
COMPONENT_BUILD_ARGS += CFLAGS="$(CFLAGS)"
COMPONENT_BUILD_ARGS += LINKFLAGS="$(LDFLAGS)"
COMPONENT_BUILD_ARGS += CPPFLAGS="$(CPPFLAGS)"
COMPONENT_BUILD_ARGS += PREFIX="$(USRDIR)"
COMPONENT_BUILD_ARGS += OPENSSL="$(USRDIR)"
COMPONENT_BUILD_ARGS += ZLIB="$(USRDIR)"

COMPONENT_BUILD_ARGS_32 = APR="$(USRDIR)/bin/apr-1-config"
COMPONENT_BUILD_ARGS_32 += APU="$(USRDIR)/bin/apu-1-config"
COMPONENT_BUILD_ARGS_32 += LIBDIR="$(USRDIR)/lib"
COMPONENT_BUILD_ARGS_64 = APR="$(USRDIR)/bin/$(MACH64)/apr-1-config"
COMPONENT_BUILD_ARGS_64 += APU="$(USRDIR)/bin/$(MACH64)/apu-1-config"
COMPONENT_BUILD_ARGS_64 += LIBDIR="$(USRDIR)/lib/$(MACH64)"

COMPONENT_BUILD_ARGS += $(COMPONENT_BUILD_ARGS_$(BITS))

COMPONENT_INSTALL_ARGS = --install-sandbox=$(PROTO_DIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

