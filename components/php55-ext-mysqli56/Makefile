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
COMPONENT_VERSION=	5.5.29
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c25a4c4eae558cc9899d2994813dd272eafff9466926f30821a83edaafe620a9
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_PHP_UK)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PHP_PREFIX=$(USRDIR)/lib/php/5.5
PHP_SYSCONFDIR=$(CONFIGURE_SYSCONFDIR)/php/5.5
PHP_DATADIR=$(CONFIGURE_LOCALSTATEDIR)/php/5.5

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

CONFIGURE_OPTIONS.64  +=	--build=$(GNU_ARCH_64)
CONFIGURE_OPTIONS.32  +=	--with-php-config=$(PHP_PREFIX)/bin/php-config
CONFIGURE_OPTIONS.64  +=	--with-php-config=$(PHP_PREFIX)/bin/$(MACH64)/php-config
CONFIGURE_OPTIONS.32  +=	--with-mysqli=$(USRDIR)/lib/mysql/5.6/bin/mysql_config
CONFIGURE_OPTIONS.64  +=	--with-mysqli=$(USRDIR)/lib/mysql/5.6/bin/$(MACH64)/mysql_config

CONFIGURE_OPTIONS     +=	$(CONFIGURE_OPTIONS.$(BITS))

CFLAGS			+=	-D_POSIX_PTHREAD_SEMANTICS
CFLAGS.32		=	-I$(USRDIR)/lib/mysql/5.6/include
CFLAGS.64		=	-I$(USRDIR)/lib/mysql/5.6/include/$(MACH64)
CPPFLAGS.32		+=	-I$(USRDIR)/lib/mysql/5.6/include
CPPFLAGS.64		+=	-I$(USRDIR)/lib/mysql/5.6/include/$(MACH64)
LDFLAGS.32		+=	-L$(USRDIR)/lib/mysql/5.6/lib -R$(USRDIR)/lib/mysql/5.6/lib
LDFLAGS.64		+=	-L$(USRDIR)/lib/mysql/5.6/lib/$(MACH64) -R$(USRDIR)/lib/mysql/5.6/lib/$(MACH64)

CFLAGS			+=	$(CFLAGS.$(BITS))
CPPFLAGS		+=	$(CPPFLAGS.$(BITS))

CONFIGURE_SCRIPT       =	$(@D)/configure

COMPONENT_PRE_CONFIGURE_ACTION	=	cp -R $(SOURCE_DIR)/ext/mysqli/* $(@D) ; \
	$(MKDIR) $(@D)/ext ; cp -R $(SOURCE_DIR)/ext/mysqlnd $(@D)/ext ; cd $(@D) ; $(PHP_PREFIX)/bin/phpize
COMPONENT_INSTALL_ARGS		+=	INSTALL_ROOT=$(PROTO_DIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

