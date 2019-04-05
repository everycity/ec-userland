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

CMAKE= cmake

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		googletest
COMPONENT_FMRI=         library/googletest
COMPONENT_VERSION=      1.8.1
COMPONENT_LICENSE=      BSD 3-Clause
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=  "https://github.com/google/googletest"
COMPONENT_SUMMARY=	Google Testing and Mocking Framework
COMPONENT_SRC=		$(COMPONENT_NAME)-release-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	release-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:9bf1fe5182a604b4135edc1a425ae356c9ad15e9b23f9f12a02e80184c3a249c
GITHUB_PROJECT=		google
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GITHUB1)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CMAKE_LIBDIR_32 = lib
CMAKE_LIBDIR_64 = lib/$(MACH64)

#CXXFLAGS += -std=c++11
CXXFLAGS += -std=c++14

CMAKE_OPTIONS += -DCMAKE_C_COMPILER="$(CC)"
CMAKE_OPTIONS += -DCMAKE_CXX_COMPILER="$(CXX)"
CMAKE_OPTIONS += -DCMAKE_C_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS += -DCMAKE_CXX_FLAGS="$(CXXFLAGS)"
CMAKE_OPTIONS += -DCMAKE_INSTALL_PREFIX=$(USRDIR)
CMAKE_OPTIONS += -DCMAKE_INSTALL_LIBDIR=$(CMAKE_LIBDIR_$(BITS))
CMAKE_OPTIONS += -DBUILD_SHARED_LIBS=ON
CMAKE_OPTIONS += -DCMAKE_SKIP_INSTALL_RPATH=YES
CMAKE_OPTIONS += -DCMAKE_SKIP_RPATH=YES

COMPONENT_PRE_BUILD_ACTION += cd $(@D);
COMPONENT_PRE_BUILD_ACTION += export LDFLAGS="$(LDFLAGS)";
COMPONENT_PRE_BUILD_ACTION += $(CMAKE) -j$(JOBS) . $(CMAKE_OPTIONS);

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

