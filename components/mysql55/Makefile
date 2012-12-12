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
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

CMAKE= cmake

COMPONENT_NAME=		mysql
COMPONENT_VERSION=	5.5.28
IPS_COMPONENT_VERSION=	5.5.28
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:f9b2491f1ddd99842a8e75c21958368bebe59c47e84bec778baa915e255cc78f
COMPONENT_ARCHIVE_URL=	http://www.mirrorservice.org/sites/ftp.mysql.com/Downloads/MySQL-5.5/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CMAKE_BINDIR.32 =	lib/mysql/5.5/bin
CMAKE_BINDIR.64 =	lib/mysql/5.5/bin/$(MACH64)
CMAKE_LIBDIR.32 =	lib/mysql/5.5/lib
CMAKE_LIBDIR.64 =	lib/mysql/5.5/lib/$(MACH64)
CMAKE_PLUGINDIR.32 =	lib/mysql/5.5/plugins
CMAKE_PLUGINDIR.64 =	lib/mysql/5.5/plugins/$(MACH64)
CMAKE_INCLUDEDIR.32 =	lib/mysql/5.5/include
CMAKE_INCLUDEDIR.64 =	lib/mysql/5.5/include/$(MACH64)

CMAKE_OPTIONS+= -DCMAKE_C_COMPILER=$(CC)
CMAKE_OPTIONS+= -DCMAKE_CXX_COMPILER=$(CCC)
CMAKE_OPTIONS+= -DCMAKE_C_FLAGS=$(CFLAGS)
CMAKE_OPTIONS+= -DCMAKE_CXX_FLAGS=$(CFLAGS)

CMAKE_OPTIONS+=	-DWITH_SSL=system

CMAKE_OPTIONS+= -DINSTALL_LAYOUT=SVR4
CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=$(ECPREFIX)
CMAKE_OPTIONS+= -DINSTALL_BINDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_DOCDIR=share/doc/mysql/5.5
CMAKE_OPTIONS+= -DINSTALL_INCLUDEDIR=$(CMAKE_INCLUDEDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_LIBDIR=$(CMAKE_LIBDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_MANDIR=lib/mysql/5.5/man
CMAKE_OPTIONS+= -DINSTALL_SHAREDIR=lib/mysql/5.5/share
CMAKE_OPTIONS+= -DINSTALL_MYSQLSHAREDIR=lib/mysql/5.5/share
CMAKE_OPTIONS+= -DINSTALL_PLUGINDIR=$(CMAKE_PLUGINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_SBINDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_SCRIPTDIR=$(CMAKE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DMYSQL_DATADIR=var/mysql/5.5/data
CMAKE_OPTIONS+= -DSYSCONFDIR=$(ECPREFIX)/etc/mysql/5.5

LDFLAGS.32	+=	-L$(ECPREFIX)/lib/mysql/5.5/lib -R$(ECPREFIX)/lib/mysql/5.5/lib
LDFLAGS.64	+=	-L$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64) -R$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64)

# gcc invocation in some link.txt file is missing -m$(BITS) parameter
# and it makes 64-bit build to fail, this is a quick hack to make it build
# for now, cmake build system needs a proper fix

COMPONENT_POST_CONFIGURE_ACTION.32=
COMPONENT_POST_CONFIGURE_ACTION.64= find $(@D) -type f -name link.txt \
    -exec perl -pi -e 's/gcc\ \ -fPIC/\/gcc\ -m64\ -fPIC/' {} \;
COMPONENT_POST_CONFIGURE_ACTION=$(COMPONENT_POST_CONFIGURE_ACTION.$(BITS))

COMPONENT_POST_INSTALL_ACTION.32 =	( perl -pi -e \
	"s/^ldata=.*/ldata=\'\/ec\/var\/mysql\/5.5\/data\'/" \
	$(PROTO_DIR)$(ECPREFIX)/$(CMAKE_BINDIR.32)/mysql_config ; \
	perl -pi -e 's/-L\$$pkglibdir/-L\$$pkglibdir -R\$$pkglibdir/g' \
	$(PROTO_DIR)$(ECPREFIX)/$(CMAKE_BINDIR.32)/mysql_config )
COMPONENT_POST_INSTALL_ACTION.64 =	( perl -pi -e \
	"s/^ldata=.*/ldata=\'\/ec\/var\/mysql\/5.5\/data\'/" \
	$(PROTO_DIR)$(ECPREFIX)/$(CMAKE_BINDIR.64)/mysql_config ; \
	perl -pi -e 's/-L\$$pkglibdir/-L\$$pkglibdir -R\$$pkglibdir/g' \
	$(PROTO_DIR)$(ECPREFIX)/$(CMAKE_BINDIR.64)/mysql_config )
COMPONENT_POST_INSTALL_ACTION=$(COMPONENT_POST_INSTALL_ACTION.$(BITS))

$(BUILD_DIR)/%/.configured:	$(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CMAKE) $(CMAKE_OPTIONS) $(SOURCE_DIR))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
