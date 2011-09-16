#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 EveryCity Ltd. All rights reserved.
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
COMPONENT_VERSION=	3.98.4
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:eb29c7c937b9b7330ca979dfabc25ab2a31b9db2
COMPONENT_ARCHIVE_URL=	http://sourceforge.net/projects/lame/files/lame/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)/download

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk
include ../../make-rules/gnu-ld.mk

# make build isn't thread safe.
COMPONENT_BUILD_GMAKE_ARGS=

COMPONENT_INSTALL_ENV+=		INSTALLROOT="$(PROTO_DIR)"

# CONFIGURE_OPTIONS from Makefile.nonnasm
#
#CONFIGURE_OPTIONS+=     --enable-analyser=no
#CONFIGURE_OPTIONS+=     --enable-brhist
#CONFIGURE_OPTIONS+=     --enable-decoder

CONFIGURE_OPTIONS+=	--enable-nasm
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--with-gnu-ld
CONFIGURE_OPTIONS.64+=	--disable-nasm

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

