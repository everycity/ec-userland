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
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		qt
COMPONENT_VERSION=	4.7.3
COMPONENT_SRC=		$(COMPONENT_NAME)-everywhere-opensource-src-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:765eb70d9779f93fefddddda5e6ddb33f4c0b71e
COMPONENT_ARCHIVE_URL=	http://get.qt.nokia.com/qt/source/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PATH.32=$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64=$(ECPREFIX)/bin/$(MACH64):/$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH=$(PATH.$(BITS))

LDFLAGS.32 +=   -L$(ECPREFIX)/lib/postgres/9.1/lib -R$(ECPREFIX)/lib/postgres/9.1/lib
LDFLAGS.64 +=	-L$(ECPREFIX)/lib/postgres/9.1/lib/$(MACH64) -R$(ECPREFIX)/lib/postgres/9.1/lib/$(MACH64)

COMPONENT_INSTALL_ENV+=	INSTALL_ROOT=$(PROTO_DIR)

CONFIGURE_OPTIONS=	-prefix $(ECPREFIX)/lib/$(COMPONENT_NAME)/4.7
CONFIGURE_OPTIONS.32=	-bindir $(ECPREFIX)/lib/$(COMPONENT_NAME)/4.7/bin
CONFIGURE_OPTIONS.32+=	-libdir $(ECPREFIX)/lib/$(COMPONENT_NAME)/4.7/lib
CONFIGURE_OPTIONS.32+=	-plugindir $(ECPREFIX)/lib/$(COMPONENT_NAME)/4.7/plugins
CONFIGURE_OPTIONS.64=	-bindir $(ECPREFIX)/lib/$(COMPONENT_NAME)/4.7/bin/$(MACH64)
CONFIGURE_OPTIONS.64+=	-libdir $(ECPREFIX)/lib/$(COMPONENT_NAME)/4.7/lib/$(MACH64)
CONFIGURE_OPTIONS.64+=	-plugindir $(ECPREFIX)/lib/$(COMPONENT_NAME)/4.7/plugins/$(MACH64)
CONFIGURE_OPTIONS.32+=	-platform solaris-g++
CONFIGURE_OPTIONS.64+=	-platform solaris-g++-64
CONFIGURE_OPTIONS+=	-opensource
CONFIGURE_OPTIONS+=	-confirm-license
CONFIGURE_OPTIONS+=	-xmlpatterns
CONFIGURE_OPTIONS+=	-webkit
CONFIGURE_OPTIONS+=	-nomake examples
CONFIGURE_OPTIONS+=	-nomake demos
CONFIGURE_OPTIONS+=	-nomake translations
CONFIGURE_OPTIONS+=	-nomake docs
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))
CONFIGURE_OPTIONS+=	-plugin-sql-sqlite
CONFIGURE_OPTIONS+=	-plugin-sql-mysql
CONFIGURE_OPTIONS+=	-plugin-sql-psql
CONFIGURE_OPTIONS+=	-system-sqlite

COMPONENT_POST_INSTALL_ACTION.32= ( cd $(PROTO_DIR)/$(ECPREFIX)/lib/qt/4.7/mkspecs ; \
	mv qconfig.pri qconfig.pri.32 )
COMPONENT_POST_INSTALL_ACTION.64= ( cd $(PROTO_DIR)/$(ECPREFIX)/lib/qt/4.7/mkspecs ; \
	mv qconfig.pri qconfig.pri.64 ; ln -s qconfig.pri.32 qconfig.pri )
COMPONENT_POST_INSTALL_ACTION=$(COMPONENT_POST_INSTALL_ACTION.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

