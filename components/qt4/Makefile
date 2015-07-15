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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		qt
COMPONENT_FMRI=		library/qt4
COMPONENT_VERSION=	4.8.6
COMPONENT_VERSION_MJR=	4.8
COMPONENT_LICENSE=	QT4
COMPONENT_PROJECT_URL=	"http://qt.nokia.com/products/"
COMPONENT_SUMMARY=	Qt cross-platform application and UI framework
COMPONENT_SRC=		$(COMPONENT_NAME)-everywhere-opensource-src-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8b14dd91b52862e09b8e6a963507b74bc2580787d171feda197badfa7034032c
COMPONENT_ARCHIVE_URL=	http://download.qt-project.org/official_releases/qt/$(COMPONENT_VERSION_MJR)/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PATH.32=$(USRDIR)/lib/postgres/9.3/bin:$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64=$(USRDIR)/lib/postgres/9.3/bin/$(MACH64):$(USRDIR)/bin/$(MACH64):/usr/bin:/usr/sfw/bin:/usr/ccs/bin:$(USRDIR)/bin
PATH=$(PATH.$(BITS))

CXXFLAGS+=	-D_GLIBCXX_USE_C99_FP_MACROS_DYNAMIC=1

LDFLAGS.32 +=   -L$(USRDIR)/lib/postgres/9.3/lib -R$(USRDIR)/lib/postgres/9.3/lib
LDFLAGS.64 +=	-L$(USRDIR)/lib/postgres/9.3/lib/$(MACH64) -R$(USRDIR)/lib/postgres/9.3/lib/$(MACH64)

COMPONENT_INSTALL_ENV+=	INSTALL_ROOT=$(PROTO_DIR)

CONFIGURE_OPTIONS=	-prefix $(USRDIR)/lib/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)
CONFIGURE_OPTIONS.32=	-bindir $(USRDIR)/lib/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)/bin
CONFIGURE_OPTIONS.32+=	-libdir $(USRDIR)/lib/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)/lib
CONFIGURE_OPTIONS.32+=	-plugindir $(USRDIR)/lib/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)/plugins
CONFIGURE_OPTIONS.64=	-bindir $(USRDIR)/lib/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)/bin/$(MACH64)
CONFIGURE_OPTIONS.64+=	-libdir $(USRDIR)/lib/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)/lib/$(MACH64)
CONFIGURE_OPTIONS.64+=	-plugindir $(USRDIR)/lib/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)/plugins/$(MACH64)
CONFIGURE_OPTIONS.32+=	-platform solaris-g++
CONFIGURE_OPTIONS.64+=	-platform solaris-g++-64
CONFIGURE_OPTIONS+=	-verbose
CONFIGURE_OPTIONS+=	-opensource
CONFIGURE_OPTIONS+=	-confirm-license
CONFIGURE_OPTIONS+=	-xmlpatterns
CONFIGURE_OPTIONS+=	-webkit
CONFIGURE_OPTIONS+=	-no-opengl
CONFIGURE_OPTIONS+=	-nomake examples
CONFIGURE_OPTIONS+=	-nomake demos
CONFIGURE_OPTIONS+=	-nomake translations
CONFIGURE_OPTIONS+=	-nomake docs
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))
CONFIGURE_OPTIONS+=	-plugin-sql-sqlite
CONFIGURE_OPTIONS+=	-plugin-sql-mysql
CONFIGURE_OPTIONS+=	-plugin-sql-psql
CONFIGURE_OPTIONS+=	-system-sqlite

COMPONENT_POST_INSTALL_ACTION.32= ( cd $(PROTO_DIR)$(USRDIR)/lib/qt/$(COMPONENT_VERSION_MJR)/mkspecs ; \
	mv qconfig.pri qconfig.pri.32 )
COMPONENT_POST_INSTALL_ACTION.64= ( cd $(PROTO_DIR)$(USRDIR)/lib/qt/$(COMPONENT_VERSION_MJR)/mkspecs ; \
	mv qconfig.pri qconfig.pri.64 ; ln -s qconfig.pri.32 qconfig.pri )
COMPONENT_POST_INSTALL_ACTION=$(COMPONENT_POST_INSTALL_ACTION.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

