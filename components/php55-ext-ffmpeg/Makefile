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
# Copyright 2014, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ffmpeg-php
COMPONENT_FMRI=		web/php-55/extension/php-ffmpeg
# Using unreleased source revision 678 from SF SVN
# Version taken from source FFMPEG_PHP_VERSION in ffmpeg-php.c
COMPONENT_VERSION=	0.7.0
COMPONENT_LICENSE=	PHP3.01
COMPONENT_PROJECT_URL=	"http://ffmpeg-php.sourceforge.net/"
COMPONENT_SUMMARY=	ffmpeg-php is an extension for PHP that adds an easy to use, object-oriented API for accessing and retrieving information from video and audio files
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE_NAME=	$(COMPONENT_NAME)-code-678-trunk
COMPONENT_ARCHIVE=	$(COMPONENT_ARCHIVE_NAME).zip
COMPONENT_ARCHIVE_HASH=	sha256:9c73100f9837a44afa555442e6f0539cda7dbd120304855cf32066067fb19eb9
COMPONENT_ARCHIVE_URL=	http://sourceforge.net/code-snapshots/svn/f/ff/$(COMPONENT_NAME)/code/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_POST_UNPACK_ACTION = ( \
	${MV} source/$(COMPONENT_ARCHIVE_NAME)/$(COMPONENT_NAME) source/ ; \
	${RM} -r source/$(COMPONENT_ARCHIVE_NAME) ; )

PHP_PREFIX=$(ECPREFIX)/lib/php/5.5
PHP_SYSCONFDIR=$(ECPREFIX)/etc/php/5.5
PHP_DATADIR=$(ECPREFIX)/var/php/5.5

CONFIGURE_OPTIONS      =	--prefix=$(PHP_PREFIX)
CONFIGURE_OPTIONS.32  +=	--bindir=$(PHP_PREFIX)/bin
CONFIGURE_OPTIONS.64  +=	--bindir=$(PHP_PREFIX)/bin/$(MACH64)
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

CONFIGURE_OPTIONS     +=	--with-ffmpeg=$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-libdir=$(ECPREFIX)/lib

CONFIGURE_OPTIONS.64  +=	--build=x86_64-pc-solaris$(SOLARIS_VERSION)
CONFIGURE_OPTIONS.32  +=	--with-php-config=$(PHP_PREFIX)/bin/php-config
CONFIGURE_OPTIONS.64  +=	--with-php-config=$(PHP_PREFIX)/bin/$(MACH64)/php-config

CONFIGURE_OPTIONS     +=	$(CONFIGURE_OPTIONS.$(BITS))

CFLAGS                +=	-I$(ECPREFIX)/include -I$(PHP_PREFIX)/include
CPPFLAGS              +=	$(CFLAGS)
LDFLAGS.32            +=	-L$(PHP_PREFIX)/lib -R$(PHP_PREFIX)/lib
LDFLAGS.64            +=	-L$(PHP_PREFIX)/lib/$(MACH64) -R$(PHP_PREFIX)/lib/$(MACH64)

CONFIGURE_SCRIPT       =	$(@D)/configure

COMPONENT_PRE_CONFIGURE_ACTION	 =	cp -R $(SOURCE_DIR)/* $(@D) ; cd $(@D) ; $(PHP_PREFIX)/bin/phpize
COMPONENT_INSTALL_ARGS		+=	INSTALL_ROOT=$(PROTO_DIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

