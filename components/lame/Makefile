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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#

# This Makefile has --enable-nasm support for 32bit encoding, which
# enables MMX/SSE assembly instructions and adds a 15%-20% performance
# boost.
#
# Unfortunately however, GNU LD has to be used to link the resultant
# libmp3lame library because Sun LD complains about linking the NASM
# produced object files.
#
# Because GCC 4.5 is compiled --with-ld=/usr/ccs/bin/ld, this
# overrides the "LD=" parameter and collect2 will as a consequence
# always call /usr/ccs/bin/ld. Setting "LD=" and passing --with-gnu-ld
# still causes autoconf, automake and libtool to use GNU LD flags,
# so we can cleverly use the LD_ALTEXEC= flag to get SUN LD to re-exec
# the GNU linker (LD_ALTEXEC is a flag specific to Sun LD).
#
# Also note that GNU binutils 2.20 is required (2.21 has bugs)

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lame
COMPONENT_VERSION=	3.99.5
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
#COMPONENT_ARCHIVE_HASH=	sha256:ac3144c76617223a9be4aaa3e28a66b51bcab28141050c3af04cb06836f772c8
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk
#include ../../make-rules/gnu-ld.mk

# make build isn't thread safe.
#override COMPONENT_BUILD_GMAKE_ARGS='-j1'

COMPONENT_INSTALL_ENV+=		INSTALLROOT="$(PROTO_DIR)"

LDFLAGS += -ltinfo

CONFIGURE_OPTIONS += --disable-debug
CONFIGURE_OPTIONS += --enable-dynamic-frontends
CONFIGURE_OPTIONS += --enable-expopt=full
#CONFIGURE_OPTIONS += --enable-nasm
CONFIGURE_OPTIONS += --with-fileio=lame

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

