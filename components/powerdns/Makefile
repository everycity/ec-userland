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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		powerdns
COMPONENT_VERSION=	3.4.1
COMPONENT_SRC=		pdns-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:13e32a31759e7fd341b98c89fe551723a5c6a768350b3609c576f70602deb24a
COMPONENT_ARCHIVE_URL=	http://downloads.powerdns.com/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

MYSQL_VERSION=5.5

LDFLAGS.32+=	-R$(ECPREFIX)/lib/mysql/$(MYSQL_VERSION)/lib
LDFLAGS.64+=	-R$(ECPREFIX)/lib/mysql/$(MYSQL_VERSION)/lib/$(MACH64)
LDFLAGS+=	-lnsl -lsocket -lresolv
COMPONENT_BUILD_ENV+=	LDFLAGS="$(LDFLAGS)"

CONFIGURE_LIBDIR.32 =   $(CONFIGURE_PREFIX)/lib/powerdns
CONFIGURE_LIBDIR.64 =   $(CONFIGURE_PREFIX)/lib/powerdns/$(MACH64)
CONFIGURE_SYSCONFDIR=	$(ECPREFIX)/etc/powerdns

CONFIGURE_OPTIONS += --with-pic
CONFIGURE_OPTIONS += --enable-shared
CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --enable-pdns_server
CONFIGURE_OPTIONS += --without-lua
CONFIGURE_OPTIONS += --with-boost=$(ECPREFIX)
CONFIGURE_OPTIONS += --with-mysql=$(ECPREFIX)/lib/mysql/$(MYSQL_VERSION)
CONFIGURE_OPTIONS.32 += --with-mysql-lib=$(ECPREFIX)/lib/mysql/$(MYSQL_VERSION)/lib
CONFIGURE_OPTIONS.32 += --with-mysql-includes=$(ECPREFIX)/lib/mysql/$(MYSQL_VERSION)/include
CONFIGURE_OPTIONS.64 += --with-mysql-lib=$(ECPREFIX)/lib/mysql/$(MYSQL_VERSION)/lib/$(MACH64)
CONFIGURE_OPTIONS.64 += --with-mysql-includes=$(ECPREFIX)/lib/mysql/$(MYSQL_VERSION)/include/$(MACH64)
CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_POST_UNPACK_ACTION+= ( cd $(SOURCE_DIR) && \
	ln -s .libs/gmysqlbackend.o modules/gmysqlbackend/gmysqlbackend.o && \
	ln -s .libs/smysql.o modules/gmysqlbackend/smysql.o && \
	ln -s .libs/geobackend.o modules/geobackend/geobackend.o && \
	ln -s .libs/ippreftree.o modules/geobackend/ippreftree.o )

COMPONENT_PRE_CONFIGURE_ACTION+= $(CLONEY) $(SOURCE_DIR) $(@D)

COMPONENT_BUILD_ENV+= CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

