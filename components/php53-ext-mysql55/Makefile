#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		php
COMPONENT_VERSION=	5.3.10
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:e36b75b6193ad593377a9ff5bad8945136a4d57b
COMPONENT_ARCHIVE_URL=	http://uk3.php.net/get/$(COMPONENT_ARCHIVE)/from/this/mirror

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PHP_PREFIX=$(ECPREFIX)/lib/php/5.3
PHP_SYSCONFDIR=$(ECPREFIX)/etc/php/5.3
PHP_DATADIR=$(ECPREFIX)/var/php/5.3

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

CONFIGURE_OPTIONS.64  +=	--build=x86_64-pc-solaris2.10
CONFIGURE_OPTIONS.32  +=	--with-php-config=$(PHP_PREFIX)/bin/php-config
CONFIGURE_OPTIONS.64  +=	--with-php-config=$(PHP_PREFIX)/bin/$(MACH64)/php-config
CONFIGURE_OPTIONS     +=	--with-mysql=$(ECPREFIX)/lib/mysql/5.5

CONFIGURE_OPTIONS     +=	$(CONFIGURE_OPTIONS.$(BITS))

CFLAGS			=	-D_POSIX_PTHREAD_SEMANTICS
CFLAGS.32		=	-I$(ECPREFIX)/lib/mysql/5.5/include
CFLAGS.64		=	-I$(ECPREFIX)/lib/mysql/5.5/include/$(MACH64)
CPPFLAGS.32           +=	-I$(ECPREFIX)/lib/mysql/5.5/include
CPPFLAGS.64           +=	-I$(ECPREFIX)/lib/mysql/5.5/include/$(MACH64)
LDFLAGS.32            +=	-L$(ECPREFIX)/lib/mysql/5.5/lib -R$(ECPREFIX)/lib/mysql/5.5/lib
LDFLAGS.64            +=	-L$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64) -R$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64)

CFLAGS			+=	$(CFLAGS.$(BITS))
CPPFLAGS		+=	$(CPPFLAGS.$(BITS))

CONFIGURE_SCRIPT       =	$(@D)/configure

COMPONENT_PRE_CONFIGURE_ACTION	 =	cp -R $(SOURCE_DIR)/ext/mysql/* $(@D) ; cd $(@D) ; $(PHP_PREFIX)/bin/phpize
COMPONENT_POST_CONFIGURE_ACTION	 =	perl -p -i -e 's/MYSQL_SHARED_LIBADD = .*/MYSQL_SHARED_LIBADD = -lmysqlclient/g' $(@D)/Makefile
COMPONENT_INSTALL_ARGS		+=	INSTALL_ROOT=$(PROTO_DIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

