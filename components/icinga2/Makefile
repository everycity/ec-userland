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

CMAKE= cmake

COMPONENT_NAME=		icinga2
COMPONENT_VERSION=	2.4.1
COMPONENT_FMRI=		monitoring/icinga2
COMPONENT_SUMMARY=	Icinga2 Monitoring System
COMPONENT_LICENSE=	GPLv2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0cd3f52ec283fbad1e68fe9c6cf91e870e0161336f1108c2d7ea044c4db934f0
COMPONENT_ARCHIVE_URL=	https://github.com/Icinga/icinga2/archive/v$(COMPONENT_VERSION).tar.gz
COMPONENT_PROJECT_URL=	https://www.icinga.org/icinga/icinga-2/

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CMAKE_OPTIONS+= -DCMAKE_C_COMPILER="$(CC)"
CMAKE_OPTIONS+= -DCMAKE_CXX_COMPILER="$(CXX)"
CMAKE_OPTIONS+= -DCMAKE_C_FLAGS="$(CFLAGS) -pthread -DSOLARIS2=11 -D_POSIX_PTHREAD_SEMANTICS"
CMAKE_OPTIONS+= -DCMAKE_CXX_FLAGS="$(CFLAGS) -pthread -DSOLARIS2=11 -D_POSIX_PTHREAD_SEMANTICS"
CMAKE_OPTIONS+= -DCMAKE_SHARED_LINKER_FLAGS="$(LDFLAGS)"
CMAKE_OPTIONS+= -DCMAKE_EXE_LINKER_FLAGS="$(LDFLAGS)"

CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=$(ECPREFIX)
CMAKE_OPTIONS+= -DCMAKE_INSTALL_SBINDIR=$(ECPREFIX)/bin

CMAKE_OPTIONS+=	-DMYSQL_INCLUDE_DIR=$(ECPREFIX)/lib/mysql/5.6/include
#CMAKE_OPTIONS+=	-DMYSQL_LIB_DIR=$(ECPREFIX)/lib/mysql/5.6/lib/$(MACH64)
CMAKE_OPTIONS+=	-DMYSQL_LIB_DIR=$(ECPREFIX)/lib/mysql/5.6/lib

CMAKE_OPTIONS+=	-DICINGA2_WITH_PGSQL=OFF

#CMAKE_OPTIONS+=	-DBUILD_TESTING=FALSE

COMPONENT_PRE_BUILD_ACTION += cd $(@D); $(CMAKE) . $(CMAKE_OPTIONS);

#COMPONENT_BUILD_ENV+=	CC="$(CC)"
#COMPONENT_BUILD_ENV+=	CXX="$(CXX)"
#COMPONENT_BUILD_ENV+=	CFLAGS="$(CFLAGS)"
#COMPONENT_BUILD_ENV+=	CXXFLAGS="$(CXXFLAGS)"

build:		$(BUILD_32)

install:	$(INSTALL_32)
