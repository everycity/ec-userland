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
# Copyright 2021 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

CMAKE= cmake

COMPONENT_NAME=		mysql
COMPONENT_VERSION=	5.6.51
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:262ccaf2930fca1f33787505dd125a7a04844f40d3421289a51974b5935d9abc
COMPONENT_ARCHIVE_URL=	http://www.mirrorservice.org/sites/ftp.mysql.com/Downloads/MySQL-5.6/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CFLAGS+=	-DHAVE_CURSES_H
CXXFLAGS+=	-DHAVE_CURSES_H
LDFLAGS+=	-lumem -lpthread

CMAKE_BINDIR.32 =	lib/mysql/5.6/bin
CMAKE_BINDIR.64 =	lib/mysql/5.6/bin/$(MACH64)
CMAKE_LIBDIR.32 =	lib/mysql/5.6/lib
CMAKE_LIBDIR.64 =	lib/mysql/5.6/lib/$(MACH64)
CMAKE_PLUGINDIR.32 =	lib/mysql/5.6/plugins
CMAKE_PLUGINDIR.64 =	lib/mysql/5.6/plugins/$(MACH64)
CMAKE_INCLUDEDIR.32 =	lib/mysql/5.6/include
CMAKE_INCLUDEDIR.64 =	lib/mysql/5.6/include/$(MACH64)
CMAKE_SHAREDIR =	lib/mysql/5.6/share

CMAKE_OPTIONS+= -DCMAKE_C_COMPILER="$(CC)"
CMAKE_OPTIONS+= -DCMAKE_CXX_COMPILER="$(CXX)"
CMAKE_OPTIONS+= -DCMAKE_C_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS+= -DCMAKE_CXX_FLAGS="$(CXXFLAGS)"

CMAKE_OPTIONS+= -DWITH_SSL=system
CMAKE_OPTIONS+=	-DWITH_LIBEVENT=system

CMAKE_OPTIONS+= -DBUILD_CONFIG=mysql_release
CMAKE_OPTIONS+= -DINSTALL_LAYOUT=SVR4
CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=$(ECPREFIX)
CMAKE_OPTIONS+= -DINSTALL_BINDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_DOCDIR=share/doc/mysql/5.6
CMAKE_OPTIONS+= -DINSTALL_INCLUDEDIR=$(CMAKE_INCLUDEDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_LIBDIR=$(CMAKE_LIBDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_MANDIR=lib/mysql/5.6/man
CMAKE_OPTIONS+= -DINSTALL_SHAREDIR=$(CMAKE_SHAREDIR)
CMAKE_OPTIONS+= -DINSTALL_MYSQLSHAREDIR=$(CMAKE_SHAREDIR)
CMAKE_OPTIONS+= -DINSTALL_SUPPORTFILESDIR=$(CMAKE_SHAREDIR)
CMAKE_OPTIONS+= -DINSTALL_PLUGINDIR=$(CMAKE_PLUGINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_SBINDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_SCRIPTDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DMYSQL_DATADIR=var/mysql/5.6/data
CMAKE_OPTIONS+= -DSYSCONFDIR=$(ECPREFIX)/etc/mysql/5.6
CMAKE_OPTIONS+= -DWITH_EXAMPLE_STORAGE_ENGINE=1
CMAKE_OPTIONS+= -DWITH_INNOBASE_STORAGE_ENGINE=1
CMAKE_OPTIONS+= -DWITH_LIBEDIT=OFF
CMAKE_OPTIONS+= -DWITH_READLINE=OFF
CMAKE_OPTIONS+= -DWITH_EXTRA_CHARSETS=all
CMAKE_OPTIONS+= -DCMAKE_SKIP_INSTALL_RPATH=ON
CMAKE_OPTIONS+= -DCMAKE_SKIP_INSTALL_RPATH-ADVANCED=1
CMAKE_OPTIONS+= -DCMAKE_SKIP_RPATH=ON
CMAKE_OPTIONS+= -DCMAKE_SKIP_RPATH-ADVANCED=1
CMAKE_OPTIONS+=	-DENABLE_DTRACE=on

LDFLAGS.32	+=	-L$(ECPREFIX)/lib/mysql/5.6/lib -R$(ECPREFIX)/lib/mysql/5.6/lib
LDFLAGS.64	+=	-L$(ECPREFIX)/lib/mysql/5.6/lib/$(MACH64) -R$(ECPREFIX)/lib/mysql/5.6/lib/$(MACH64)

COMPONENT_PRE_BUILD_ACTION += cd $(@D);
COMPONENT_PRE_BUILD_ACTION += export LDFLAGS="$(LDFLAGS) -lstdc++";
COMPONENT_PRE_BUILD_ACTION += $(CMAKE) . $(CMAKE_OPTIONS);
#COMPONENT_PRE_BUILD_ACTION += sed -i -e 's!/ec/bin/gcc!/ec/bin/g++!' libmysql/CMakeFiles/libmysql.dir/link.txt;

COMPONENT_POST_BUILD_ACTION.32 += sed -i -e 's!"share","share/mysql","support-files"!"lib/mysql/5.6/share"!' $(BUILD_DIR_32)/scripts/mysql_install_db;
COMPONENT_POST_BUILD_ACTION.64 += sed -i -e 's!"share","share/mysql","support-files"!"lib/mysql/5.6/share"!' $(BUILD_DIR_64)/scripts/mysql_install_db;
COMPONENT_POST_BUILD_ACTION += $(COMPONENT_POST_BUILD_ACTION.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
