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
# Copyright 2015, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		php
COMPONENT_VERSION=	5.5.38
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:4f458c9b504269615715a62f182b7c2f89bb8284f484befc221b56a1571b506e
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_PHP_UK)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PHP_PREFIX=$(ECPREFIX)/lib/php/5.5
PHP_SYSCONFDIR=$(ECPREFIX)/etc/php/5.5
PHP_DATADIR=$(ECPREFIX)/var/php/5.5

CONFIGURE_OPTIONS	=	--prefix=$(PHP_PREFIX)
CONFIGURE_OPTIONS.32	=	--bindir=$(PHP_PREFIX)/bin
CONFIGURE_OPTIONS.64	=	--bindir=$(PHP_PREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32  +=	--sbindir=$(PHP_PREFIX)/bin
CONFIGURE_OPTIONS.64  +=	--sbindir=$(PHP_PREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32  +=	--libdir=$(PHP_PREFIX)/lib
CONFIGURE_OPTIONS.64  +=	--libdir=$(PHP_PREFIX)/lib/$(MACH64)
CONFIGURE_OPTIONS.32  +=	--libexecdir=$(PHP_PREFIX)/libexec
CONFIGURE_OPTIONS.64  +=	--libexecdir=$(PHP_PREFIX)/libexec/$(MACH64)
CONFIGURE_OPTIONS     +=	--includedir=$(PHP_PREFIX)/include
CONFIGURE_OPTIONS     +=	--sysconfdir=$(PHP_SYSCONFDIR)
CONFIGURE_OPTIONS     +=	--datadir=$(PHP_DATADIR)
CONFIGURE_OPTIONS     +=	--mandir=$(PHP_PREFIX)/share/man
CONFIGURE_OPTIONS     +=	--with-zlib-dir=$(ECPREFIX)
CONFIGURE_OPTIONS.64  +=	--build=x86_64-pc-solaris2.10
CONFIGURE_OPTIONS.32  +=	--with-php-config=$(PHP_PREFIX)/bin/php-config
CONFIGURE_OPTIONS.64  +=	--with-php-config=$(PHP_PREFIX)/bin/$(MACH64)/php-config
CONFIGURE_OPTIONS     +=	--with-pdo-mysql=$(ECPREFIX)/lib/mysql/5.6

CONFIGURE_OPTIONS     +=	$(CONFIGURE_OPTIONS.$(BITS))

CFLAGS			+=	-D_POSIX_PTHREAD_SEMANTICS
CFLAGS.32		=	-I$(ECPREFIX)/lib/mysql/5.6/include
CFLAGS.64		=	-I$(ECPREFIX)/lib/mysql/5.6/include/$(MACH64)
CPPFLAGS.32           +=	-I$(ECPREFIX)/lib/mysql/5.6/include
CPPFLAGS.64           +=	-I$(ECPREFIX)/lib/mysql/5.6/include/$(MACH64)
LDFLAGS.32            +=	-L$(ECPREFIX)/lib/mysql/5.6/lib -R$(ECPREFIX)/lib/mysql/5.6/lib
LDFLAGS.64            +=	-L$(ECPREFIX)/lib/mysql/5.6/lib/$(MACH64) -R$(ECPREFIX)/lib/mysql/5.6/lib/$(MACH64)

CFLAGS                +=	$(CFLAGS.$(BITS))
CPPFLAGS              +=	$(CPPFLAGS.$(BITS))

CONFIGURE_ENV         +=	PHP_PDO_MYSQL="$(ECPREFIX)/lib/mysql/5.6/bin/mysql_config"
CONFIGURE_SCRIPT       =	$(@D)/configure

COMPONENT_PRE_CONFIGURE_ACTION	=	cp -R $(SOURCE_DIR)/ext/pdo_mysql/* $(@D) ; cd $(@D) ; $(PHP_PREFIX)/bin/phpize
COMPONENT_POST_CONFIGURE_ACTION	=	perl -p -i -e 's/PDO_MYSQL_SHARED_LIBADD = .*/PDO_MYSQL_SHARED_LIBADD = -lmysqlclient -lthread -lsocket -lz -lnsl -lm -lrt/g' $(@D)/Makefile
COMPONENT_INSTALL_ARGS		+=	INSTALL_ROOT=$(PROTO_DIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

