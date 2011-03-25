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
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lame
COMPONENT_VERSION=	3.98.4
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:eb29c7c937b9b7330ca979dfabc25ab2a31b9db2
COMPONENT_ARCHIVE_URL=	http://sourceforge.net/projects/lame/files/lame/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)/download

CONFIGURE_OPTIONS.32  += LD=/ec/bin/ld LD_ALTEXEC=/ec/bin/ld --with-ld=/ec/bin/ld --enable-nasm --disable-static --with-gnu-ld
CONFIGURE_OPTIONS.64  += LDFLAGS="-Wl,-melf_x86_64_sol2" LD=/ec/bin/ld LD_ALTEXEC=/ec/bin/ld --with-ld=/ec/bin/ld --disable-nasm --disable-static --with-gnu-ld --build=x86_64-pc-solaris2.10
COMPONENT_BUILD_ENV += LDFLAGS="-Wl,-melf_x86_64_sol2"  LD=/ec/bin/ld LD_ALTEXEC=/ec/bin/ld
COMPONENT_INSTALL_ENV += INSTALLROOT="$(PROTO_DIR)"

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

include ../../make-rules/shared-targets.mk

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
