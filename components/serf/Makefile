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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		serf
COMPONENT_FMRI=         library/serf
COMPONENT_VERSION=      1.3.9
COMPONENT_LICENSE=      Apachev2
COMPONENT_PROJECT_URL=  "http://code.google.com/p/serf/"
COMPONENT_SUMMARY=	A high performance C-based HTTP client library built upon the Apache Portable Runtime (APR) library.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf7a87cc
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

GMAKE=scons
COMPONENT_BUILD_GMAKE_ARGS_32=	APR=$(ECPREFIX)/bin/apr-1-config APU=$(ECPREFIX)/bin/apu-1-config OPENSSL=$(ECPREFIX) ZLIB=$(ECPREFIX)
COMPONENT_BUILD_GMAKE_ARGS_32+=	PREFIX=$(ECPREFIX) LIBDIR=$(ECPREFIX)/lib CC="$(ECPREFIX)/bin/gcc -m$(BITS)" CPPFLAGS=-D__EXTENSIONS__
COMPONENT_BUILD_GMAKE_ARGS_64=	APR=$(ECPREFIX)/bin/$(MACH64)/apr-1-config APU=$(ECPREFIX)/bin/$(MACH64)/apu-1-config OPENSSL=$(ECPREFIX) ZLIB=$(ECPREFIX)
COMPONENT_BUILD_GMAKE_ARGS_64+=	PREFIX=$(ECPREFIX) LIBDIR=$(ECPREFIX)/lib/$(MACH64) CC="$(ECPREFIX)/bin/gcc -m$(BITS)" CPPFLAGS=-D__EXTENSIONS__
COMPONENT_BUILD_GMAKE_ARGS=	$(COMPONENT_BUILD_GMAKE_ARGS_$(BITS))
#CONFIGURE_OPTIONS+=	
COMPONENT_INSTALL_ARGS=	--install-sandbox=$(PROTO_DIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

