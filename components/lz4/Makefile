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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lz4
COMPONENT_FMRI=		compress/lz4
COMPONENT_VERSION=	1.8.3
COMPONENT_LICENSE=	BSD,GPLv2
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=	"http://lz4.github.io/lz4/"
COMPONENT_SUMMARY=	LZ4 is a very fast lossless compression algorithm
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	v$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:33af5936ac06536805f9745e0b6d61da606a1f8b4cc5c04dd3cbaca3b9b4fc43
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GITHUB1)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

BINDIR_32=$(USRDIR)/bin
BINDIR_64=$(USRDIR)/bin/$(MACH64)
LIBDIR_32=$(USRDIR)/lib
LIBDIR_64=$(USRDIR)/lib/$(MACH64)

COMPONENT_BUILD_ARGS += PREFIX=$(USRDIR) DESTDIR=$(PROTO_DIR) BINDIR=$(BINDIR_$(BITS)) LIBDIR=$(LIBDIR_$(BITS)) MANDIR=$(USRDIR)/share/man/man1
COMPONENT_BUILD_ARGS += CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
COMPONENT_BUILD_ARGS += CC="$(CC) $(CC_BITS)"
COMPONENT_INSTALL_ARGS += PREFIX=$(USRDIR) DESTDIR=$(PROTO_DIR) BINDIR=$(BINDIR_$(BITS)) LIBDIR=$(LIBDIR_$(BITS)) MANDIR=$(USRDIR)/share/man/man1
COMPONENT_INSTALL_ARGS += CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
COMPONENT_INSTALL_ARGS += CC="$(CC) $(CC_BITS)" INSTALL="$(INSTALL)"

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
