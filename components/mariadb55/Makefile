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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mariadb
COMPONENT_FMRI=         database/mariadb-55
COMPONENT_VERSION_MJR=	5.5
COMPONENT_VERSION_MNR=	34
IPS_COMPONENT_VERSION=	5.5.34
COMPONENT_VERSION=	$(COMPONENT_VERSION_MJR).$(COMPONENT_VERSION_MNR)
COMPONENT_LICENSE=      BSD, LGPL, GPL
COMPONENT_PROJECT_URL=  https://mariadb.org/
COMPONENT_SUMMARY=	An enhanced, drop-in replacement for MySQL
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:a4d8b54be0f5784924629a1e87dbbccc4c0aaf537c76951e265625deda322f89
COMPONENT_ARCHIVE_URL=	https://downloads.mariadb.org/f/$(COMPONENT_SRC)/kvm-tarbake-jaunty-x86/$(COMPONENT_ARCHIVE)/from/http:/mirror.stshosting.co.uk/mariadb

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CMAKE_BINDIR.32 =       lib/mariadb/$(COMPONENT_VERSION_MJR)/bin
CMAKE_BINDIR.64 =       lib/mariadb/$(COMPONENT_VERSION_MJR)/bin/$(MACH64)
CMAKE_LIBDIR.32 =       lib/mariadb/$(COMPONENT_VERSION_MJR)/lib
CMAKE_LIBDIR.64 =       lib/mariadb/$(COMPONENT_VERSION_MJR)/lib/$(MACH64)
CMAKE_PLUGINDIR.32 =    lib/mariadb/$(COMPONENT_VERSION_MJR)/plugins
CMAKE_PLUGINDIR.64 =    lib/mariadb/$(COMPONENT_VERSION_MJR)/plugins/$(MACH64)
CMAKE_INCLUDEDIR.32 =   lib/mariadb/$(COMPONENT_VERSION_MJR)/include
CMAKE_INCLUDEDIR.64 =   lib/mariadb/$(COMPONENT_VERSION_MJR)/include/$(MACH64)

CMAKE_OPTIONS+= -DCMAKE_C_COMPILER=$(CC)
CMAKE_OPTIONS+= -DCMAKE_CXX_COMPILER=$(CCC)
CMAKE_OPTIONS+= -DCMAKE_C_FLAGS=$(CFLAGS)
CMAKE_OPTIONS+= -DCMAKE_CXX_FLAGS=$(CFLAGS)

CMAKE_OPTIONS+= -DWITH_SSL=system

CMAKE_OPTIONS+= -DINSTALL_LAYOUT=SVR4
CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=$(ECPREFIX)
CMAKE_OPTIONS+= -DINSTALL_BINDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_DOCDIR=share/doc/mariadb/$(COMPONENT_VERSION_MJR)
CMAKE_OPTIONS+= -DINSTALL_INCLUDEDIR=$(CMAKE_INCLUDEDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_LIBDIR=$(CMAKE_LIBDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_MANDIR=lib/mariadb/$(COMPONENT_VERSION_MJR)/man
CMAKE_OPTIONS+= -DINSTALL_SHAREDIR=lib/mariadb/$(COMPONENT_VERSION_MJR)/share
CMAKE_OPTIONS+= -DINSTALL_MYSQLSHAREDIR=lib/mariadb/$(COMPONENT_VERSION_MJR)/share
CMAKE_OPTIONS+= -DINSTALL_PLUGINDIR=$(CMAKE_PLUGINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_SBINDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_SCRIPTDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DMYSQL_DATADIR=var/mariadb/$(COMPONENT_VERSION_MJR)/data
CMAKE_OPTIONS+= -DSYSCONFDIR=$(ECPREFIX)/etc/mariadb/$(COMPONENT_VERSION_MJR)
CMAKE_OPTIONS+=	-DWITHOUT_OQGRAPH_STORAGE_ENGINE=1

LDFLAGS.32      +=      -L$(ECPREFIX)/lib/mariadb/$(COMPONENT_VERSION_MJR)/lib -R$(ECPREFIX)/lib/mariadb/$(COMPONENT_VERSION_MJR)/lib
LDFLAGS.64      +=      -L$(ECPREFIX)/lib/mariadb/$(COMPONENT_VERSION_MJR)/lib/$(MACH64) -R$(ECPREFIX)/lib/mariadb/$(COMPONENT_VERSION_MJR)/lib/$(MACH64)

COMPONENT_POST_INSTALL_ACTION.32 =      ( perl -pi -e \
	"s/^ldata=.*/ldata=\'\/ec\/var\/mariadb\/$(COMPONENT_VERSION_MJR)\/data\'/" \
	$(PROTO_DIR)$(ECPREFIX)/$(CMAKE_BINDIR.32)/mysql_config ; \
	perl -pi -e 's/-L\$$pkglibdir/-L\$$pkglibdir -R\$$pkglibdir/g' \
	$(PROTO_DIR)$(ECPREFIX)/$(CMAKE_BINDIR.32)/mysql_config )
COMPONENT_POST_INSTALL_ACTION.64 =      ( perl -pi -e \
	"s/^ldata=.*/ldata=\'\/ec\/var\/mariadb\/$(COMPONENT_VERSION_MJR)\/data\'/" \
	$(PROTO_DIR)$(ECPREFIX)/$(CMAKE_BINDIR.64)/mysql_config ; \
	perl -pi -e 's/-L\$$pkglibdir/-L\$$pkglibdir -R\$$pkglibdir/g' \
	$(PROTO_DIR)$(ECPREFIX)/$(CMAKE_BINDIR.64)/mysql_config )
COMPONENT_POST_INSTALL_ACTION=$(COMPONENT_POST_INSTALL_ACTION.$(BITS))

$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CMAKE) $(CMAKE_OPTIONS) $(SOURCE_DIR))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

