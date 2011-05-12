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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

CMAKE= cmake

COMPONENT_NAME=		mysql
COMPONENT_VERSION=	5.5.12
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
#COMPONENT_ARCHIVE_HASH=	sha1:7e0b426d7a9ef0eaa6e2b2ea3e5fef1e1a078c5d
COMPONENT_ARCHIVE_URL=	http://www.mirrorservice.org/sites/ftp.mysql.com/Downloads/MySQL-5.5/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CMAKE_BINDIR.32 =	lib/mysql55/bin
CMAKE_BINDIR.64 =	lib/mysql55/bin/$(MACH64)
CMAKE_LIBDIR.32 =	lib
CMAKE_LIBDIR.64 =	lib/$(MACH64)
CMAKE_PLUGINDIR.32 =	lib/mysql55/plugins
CMAKE_PLUGINDIR.64 =	lib/mysql55/plugins/$(MACH64)
CMAKE_INCLUDEDIR.32 =	include
CMAKE_INCLUDEDIR.64 =	include/$(MACH64)

CMAKE_OPTIONS+= -DCMAKE_C_COMPILER=$(CC)
CMAKE_OPTIONS+= -DCMAKE_CXX_COMPILER=$(CCC)
CMAKE_OPTIONS+= -DCMAKE_C_FLAGS=$(CFLAGS)
CMAKE_OPTIONS+= -DCMAKE_CXX_FLAGS=$(CFLAGS)

CMAKE_OPTIONS+= -DINSTALL_LAYOUT=SVR4
CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=$(ECPREFIX)
CMAKE_OPTIONS+= -DINSTALL_BINDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_DOCDIR=share/doc/mysql55
CMAKE_OPTIONS+= -DINSTALL_INCLUDEDIR=$(CMAKE_INCLUDEDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_LIBDIR=$(CMAKE_LIBDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_MANDIR=lib/mysql55/man
CMAKE_OPTIONS+= -DINSTALL_MYSQLSHAREDIR=share/mysql55
CMAKE_OPTIONS+= -DINSTALL_PLUGINDIR=$(CMAKE_PLUGINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_SBINDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_SCRIPTDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DMYSQL_DATADIR=var/mysql55/data
CMAKE_OPTIONS+= -DSYSCONFDIR=etc/mysql55


# gcc invocation in some link.txt file is missing -m$(BITS) parameter
# and it makes 64-bit build to fail, this is a quick hack to make it build
# for now, cmake build system needs a proper fix

COMPONENT_POST_CONFIGURE_ACTION.32=
COMPONENT_POST_CONFIGURE_ACTION.64= find $(@D) -type f -name link.txt \
    -exec perl -pi -e 's/gcc\ \ -fPIC/\/gcc\ -m64\ -fPIC/' {} \;
COMPONENT_POST_CONFIGURE_ACTION=$(COMPONENT_POST_CONFIGURE_ACTION.$(BITS))


$(BUILD_DIR)/%/.configured:	$(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CMAKE) $(CMAKE_OPTIONS) $(SOURCE_DIR))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
