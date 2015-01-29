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

COMPONENT_NAME=		cppcms
COMPONENT_FMRI=         web/framework/cppcms
COMPONENT_VERSION=      1.0.5
COMPONENT_LICENSE=      LGPLv3
COMPONENT_PROJECT_URL=  "http://cppcms.com/"
COMPONENT_SUMMARY=	CppCMS is a Free High Performance Web Development Framework
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:84b685977bca97c3e997497f227bd5906adb80555066d811a7046b01c2f51865
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CMAKE_LIBDIR_32 =	$(ECPREFIX)/lib

CMAKE_OPTIONS =		-DCMAKE_BUILD_TYPE=Release
CMAKE_OPTIONS +=	-DCMAKE_C_COMPILER="$(CC)"
CMAKE_OPTIONS +=	-DCMAKE_CXX_COMPILER="$(CXX)"
CMAKE_OPTIONS +=	-DCMAKE_C_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS +=	-DCMAKE_CXX_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS +=	-DCMAKE_INCLUDE_PATH=$(ECPREFIX)/include
CMAKE_OPTIONS +=	-DCMAKE_LIBRARY_PATH=$(CMAKE_LIBDIR_$(BITS))
CMAKE_OPTIONS +=	-DCMAKE_INSTALL_PREFIX=$(ECPREFIX)

COMPONENT_PRE_BUILD_ACTION += cd $(@D);
COMPONENT_PRE_BUILD_ACTION += $(CMAKE) . $(CMAKE_OPTIONS);

build:		$(BUILD_32)

$(BUILD_DIR)/.installed:	$(INSTALL_32)
	$(GSED) -i -e 's%^#!/usr/bin/env python%#!$(ECPREFIX)/bin/python2.6%' $(PROTO_DIR)$(ECPREFIX)/bin/cppcms_tmpl_cc
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
