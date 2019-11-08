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
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		php
COMPONENT_VERSION=	7.2.24
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:a6a6cc03388060aa5f8f9e45799b72bce1c7ed7b9d7b3f1187787202aad91d25
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_PHP_UK)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PHP_PREFIX=$(ECPREFIX)/lib/php/7.2
PHP_SYSCONFDIR=$(ECPREFIX)/etc/php/7.2
PHP_DATADIR=$(ECPREFIX)/var/php/7.2

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
CONFIGURE_OPTIONS.32  +=	--with-pgsql=$(ECPREFIX)/lib/postgres/9.3/bin/
CONFIGURE_OPTIONS.64  +=	--with-pgsql=$(ECPREFIX)/lib/postgres/9.3/bin/$(MACH64)/

CONFIGURE_OPTIONS     +=	$(CONFIGURE_OPTIONS.$(BITS))

CFLAGS			+=	-D_POSIX_PTHREAD_SEMANTICS
CFLAGS.32		=	-I$(ECPREFIX)/lib
CFLAGS.64		=	-I$(ECPREFIX)/lib/$(MACH64)
CPPFLAGS.32           +=	-I$(ECPREFIX)/include
CPPFLAGS.64           +=	-I$(ECPREFIX)/include/$(MACH64)
LDFLAGS.32            +=	-L$(ECPREFIX)/lib -R$(ECPREFIX)/lib
LDFLAGS.64            +=	-L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64)

CFLAGS			+=	$(CFLAGS.$(BITS))
CPPFLAGS		+=	$(CPPFLAGS.$(BITS))

CONFIGURE_SCRIPT       =	$(@D)/configure

COMPONENT_PRE_CONFIGURE_ACTION	 =	cp -R $(SOURCE_DIR)/ext/pgsql/* $(@D) ; cd $(@D) ; $(PHP_PREFIX)/bin/phpize
COMPONENT_INSTALL_ARGS		+=	INSTALL_ROOT=$(PROTO_DIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

