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

COMPONENT_NAME=		lz4
COMPONENT_FMRI=		compress/lz4
COMPONENT_VERSION=	127
IPS_COMPONENT_VERSION=	0.0.1.$(COMPONENT_VERSION)
COMPONENT_LICENSE=	BSD,GPLv2
COMPONENT_PROJECT_URL=	"http://code.google.com/p/lz4/"
COMPONENT_SUMMARY=	LZ4 is a very fast lossless compression algorithm
COMPONENT_SRC=		$(COMPONENT_NAME)-r$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:5209bf7a2231b41222b0cea4229700bae459b523bc13db488f0e1279405e6b43
COMPONENT_ARCHIVE_URL=	https://github.com/Cyan4973/lz4/archive/r127.tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

BINDIR_32=$(USRDIR)/bin
BINDIR_64=$(USRDIR)/bin/$(MACH64)
LIBDIR_32=$(USRDIR)/lib
LIBDIR_64=$(USRDIR)/lib/$(MACH64)

COMPONENT_BUILD_ARGS += PREFIX=$(USRDIR) DESTDIR=$(PROTO_DIR) BINDIR=$(BINDIR_$(BITS)) LIBDIR=$(LIBDIR_$(BITS))
COMPONENT_BUILD_ARGS += CC="$(CC) $(CC_BITS)"
COMPONENT_BUILD_ARGS += CFLAGS="$(CFLAGS) -D_XOPEN_SOURCE=600 -D_FILE_OFFSET_BITS=64 -I. -std=c99 -Wall -W -Wundef -Wno-implicit-function-declaration"
COMPONENT_BUILD_TARGETS = all
COMPONENT_INSTALL_ARGS += PREFIX=$(USRDIR) DESTDIR=$(PROTO_DIR) BINDIR=$(BINDIR_$(BITS)) LIBDIR=$(LIBDIR_$(BITS))
COMPONENT_INSTALL_ARGS += CC="$(CC) $(CC_BITS)"
COMPONENT_INSTALL_ARGS += CFLAGS="$(CFLAGS) -D_XOPEN_SOURCE=600 -D_FILE_OFFSET_BITS=64 -I. -std=c99 -Wall -W -Wundef -Wno-implicit-function-declaration"

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
