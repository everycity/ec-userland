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

COMPONENT_NAME=		m4
COMPONENT_VERSION=	1.4.16
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:0390c77780ab4cd65b07fe4e2d23e4e39769f967
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CPPFLAGS+= -I$(ECPREFIX)/include

#CONFIGURE_OPTIONS  +=           CPPFLAGS="$(CPPFLAGS)"
#CONFIGURE_OPTIONS  +=           M4=$(M4)
#CONFIGURE_OPTIONS  +=           ABI=32
#CONFIGURE_OPTIONS  +=           --disable-static
CONFIGURE_OPTIONS  +=           --program-prefix=g

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

test32:		$(BUILD_32)
	(cd $(BUILD_DIR_32); $(GMAKE) check)

test:	test32

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

