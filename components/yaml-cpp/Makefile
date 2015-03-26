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

COMPONENT_NAME=		yaml-cpp
COMPONENT_FMRI=         library/yaml-cpp
COMPONENT_VERSION=      0.5.1
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "https://code.google.com/p/yaml-cpp/"
COMPONENT_SUMMARY=	yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3e7c9052b43d987d41819a203d97fc45de4eed3ec67e0fdb14265c3d11046f06
COMPONENT_ARCHIVE_URL=	http://$(COMPONENT_NAME).googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CMAKE=cmake

CMAKE_OPTIONS+= -DCMAKE_C_COMPILER="$(CC)"
CMAKE_OPTIONS+= -DCMAKE_CXX_COMPILER="$(CXX)"
CMAKE_OPTIONS+= -DCMAKE_C_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS+= -DCMAKE_CXX_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=$(ECPREFIX)
CMAKE_OPTIONS+=	-DBUILD_SHARED_LIBS=ON

COMPONENT_PRE_BUILD_ACTION += cd $(@D);
COMPONENT_PRE_BUILD_ACTION += export LDFLAGS="$(LDFLAGS)";
COMPONENT_PRE_BUILD_ACTION += $(CMAKE) . $(CMAKE_OPTIONS);

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

