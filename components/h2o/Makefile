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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		h2o
COMPONENT_FMRI=         web/server/h2o
COMPONENT_VERSION=      2.0.4
COMPONENT_LICENSE=      MIT
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=  "http://h2o.github.io/"
COMPONENT_SUMMARY=	H2O is a very fast HTTP server written in C. It can also be used as a library.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c0efa18f0ffb0f68ee4b60a6ed1feb54c770458c59e48baa2d9d0906ef9c68c0
COMPONENT_ARCHIVE_URL=	https://github.com/$(COMPONENT_NAME)/$(COMPONENT_NAME)/archive/v$(COMPONENT_VERSION).tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CMAKE_INSTALL_RPATH_64=	/ec/gcc/4.8/lib/64:/ec/lib/64

CMAKE_OPTIONS+=	-DCMAKE_C_COMPILER="$(CC)"
CMAKE_OPTIONS+=	-DCMAKE_CXX_COMPILER="$(CXX)"
CMAKE_OPTIONS+=	-DCMAKE_C_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS+=	-DCMAKE_CXX_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS+=	-DCMAKE_INSTALL_PREFIX=$(ECPREFIX)
CMAKE_OPTIONS+=	-DBUILD_SHARED_LIBS=ON
CMAKE_OPTIONS+=	-DWITH_BUNDLED_SSL=OFF
CMAKE_OPTIONS+=	-DCMAKE_INSTALL_RPATH="$(CMAKE_INSTALL_RPATH_$(BITS))"

COMPONENT_PRE_BUILD_ACTION += cd $(@D);
COMPONENT_PRE_BUILD_ACTION += export LDFLAGS="$(LDFLAGS)";
COMPONENT_PRE_BUILD_ACTION += $(CMAKE) . $(CMAKE_OPTIONS);

build:		$(BUILD_64)

install:	$(INSTALL_64)

