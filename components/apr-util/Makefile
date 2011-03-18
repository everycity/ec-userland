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

COMPONENT_NAME=		apr-util
COMPONENT_VERSION=	1.3.10
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:9a720cf77f1d0fdc5b0f6ce6d656cc864d7d4833
COMPONENT_ARCHIVE_URL=	http://mirror.metrocast.net/apache/apr/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

APUPREFIX=$(ECPREFIX)/apr-util/1.3

CONFIGURE_OPTIONS  +=		--prefix=$(APUPREFIX)
CONFIGURE_OPTIONS  +=		--with-ldap
CONFIGURE_OPTIONS.32 += --bindir=$(APUPREFIX)/bin
CONFIGURE_OPTIONS.64 += --bindir=$(APUPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32 += --libdir=$(APUPREFIX)/lib
CONFIGURE_OPTIONS.64 += --libdir=$(APUPREFIX)/lib/$(MACH64)
CONFIGURE_OPTIONS.32 += --with-apr=$(ECPREFIX)/apr/1.4/bin/apr-1-config
CONFIGURE_OPTIONS.64 += --with-apr=$(ECPREFIX)/apr/1.4/bin/amd64/apr-1-config

build:		$(BUILD_32_and_64)

include ../../make-rules/shared-targets.mk

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
