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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		php
COMPONENT_VERSION=	5.3.28
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ace8fde82a4275d6dcec4e15feb047416e1813fea46e159dfd113298371396d0
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_PHP_UK)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# Apache Paths
AP_PREFIX=$(ECPREFIX)/lib/apache/2.2
AP_SYSCONFDIR=$(ECPREFIX)/etc/apache/2.2

# PHP Paths
PHP_PREFIX=$(ECPREFIX)/lib/php/5.3
PHP_SYSCONFDIR=$(ECPREFIX)/etc/php/5.3
PHP_DATADIR=$(ECPREFIX)/var/php/5.3

CFLAGS += -D_POSIX_PTHREAD_SEMANTICS

# Configure Options

CONFIGURE_OPTIONS      =	--prefix=$(PHP_PREFIX)
CONFIGURE_OPTIONS.32   =	--bindir=$(PHP_PREFIX)/bin
CONFIGURE_OPTIONS.64   =	--bindir=$(PHP_PREFIX)/bin/$(MACH64)
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

CONFIGURE_OPTIONS.64  +=	--build=x86_64-pc-solaris$(SOLARIS_VERSION)

CONFIGURE_OPTIONS     +=	--with-config-file-path=$(PHP_SYSCONFDIR)
CONFIGURE_OPTIONS     +=	--with-config-file-scan-dir=$(PHP_SYSCONFDIR)/conf.d
CONFIGURE_OPTIONS     +=	--with-pear=$(PHP_PREFIX)/share/PEAR

CONFIGURE_OPTIONS     +=	--with-layout=PHP
CONFIGURE_OPTIONS     +=	--with-zend-vm=CALL

CONFIGURE_OPTIONS     +=	--with-cdb
CONFIGURE_OPTIONS     +=	--with-kerberos
CONFIGURE_OPTIONS     +=	--with-pcre-regex

# Shared Extensions
CONFIGURE_OPTIONS     +=	--with-curlwrappers
CONFIGURE_OPTIONS     +=	--with-gettext=shared
CONFIGURE_OPTIONS     +=	--with-xmlrpc=shared
CONFIGURE_OPTIONS     +=	--with-gd=shared
CONFIGURE_OPTIONS     +=	--with-zlib=shared
CONFIGURE_OPTIONS     +=	--with-openssl=shared
CONFIGURE_OPTIONS     +=	--with-pdo-sqlite=shared
CONFIGURE_OPTIONS     +=	--with-sqlite=shared
CONFIGURE_OPTIONS     +=	--with-ldap=shared

# Shared Extensions
CONFIGURE_OPTIONS     +=	--with-bz2=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-iconv=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-tidy=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-mhash=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-mcrypt=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-xsl=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-curl=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-readline=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-pspell=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-imap=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-imap-ssl

# Enabled Extensions
CONFIGURE_OPTIONS     +=	--with-libxml-dir=$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-freetype-dir=$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-jpeg-dir=$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-png-dir=$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-zlib-dir=$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-xpm-dir=$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-libexpat-dir=$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-openssl-dir=$(ECPREFIX)

# Disabled extensions & Options
CONFIGURE_OPTIONS     +=	--disable-static
CONFIGURE_OPTIONS     +=	--disable-dba
CONFIGURE_OPTIONS     +=	--disable-debug
CONFIGURE_OPTIONS     +=	--disable-libgcc
#CONFIGURE_OPTIONS     +=	--disable-inline-optimization
#CONFIGURE_OPTIONS     +=	--disable-libtool-lock
#CONFIGURE_OPTIONS     +=	--disable-rpath
CONFIGURE_OPTIONS     +=	--enable-dtrace
CONFIGURE_OPTIONS     +=	--without-dbm
CONFIGURE_OPTIONS     +=	--without-t1lib

# Enabled extensions
CONFIGURE_OPTIONS     +=	--enable-cli
#CONFIGURE_OPTIONS     +=	--enable-cgi
#CONFIGURE_OPTIONS     +=	--enable-fpm
CONFIGURE_OPTIONS     +=	--enable-shared
CONFIGURE_OPTIONS     +=	--enable-filter
CONFIGURE_OPTIONS     +=	--enable-gd-jis-conv
CONFIGURE_OPTIONS     +=	--enable-magic-quotes
CONFIGURE_OPTIONS     +=	--enable-short-tags
CONFIGURE_OPTIONS     +=	--enable-zend-multibyte
CONFIGURE_OPTIONS     +=	--enable-pcntl
CONFIGURE_OPTIONS     +=	--enable-shmop
CONFIGURE_OPTIONS     +=	--enable-sqlite-utf8
CONFIGURE_OPTIONS     +=	--enable-sysvmsg
CONFIGURE_OPTIONS     +=	--enable-sysvsem
CONFIGURE_OPTIONS     +=	--enable-sysvshm
CONFIGURE_OPTIONS     +=	--enable-simplexml
CONFIGURE_OPTIONS     +=	--enable-hash
CONFIGURE_OPTIONS     +=	--enable-session
CONFIGURE_OPTIONS     +=	--enable-intl

# Shared Extensions
CONFIGURE_OPTIONS     +=	--enable-bcmath=shared
CONFIGURE_OPTIONS     +=	--enable-json=shared
CONFIGURE_OPTIONS     +=	--enable-libxml=shared
CONFIGURE_OPTIONS     +=	--enable-ctype=shared
CONFIGURE_OPTIONS     +=	--enable-calendar=shared
CONFIGURE_OPTIONS     +=	--enable-tokenizer=shared
CONFIGURE_OPTIONS     +=	--enable-exif=shared
CONFIGURE_OPTIONS     +=	--enable-dom=shared
CONFIGURE_OPTIONS     +=	--enable-ftp=shared
CONFIGURE_OPTIONS     +=	--enable-pdo=shared
CONFIGURE_OPTIONS     +=	--enable-mbstring=shared
CONFIGURE_OPTIONS     +=	--enable-xmlreader=shared
CONFIGURE_OPTIONS     +=	--enable-xmlwriter=shared
CONFIGURE_OPTIONS     +=	--enable-soap=shared
CONFIGURE_OPTIONS     +=	--enable-sockets=shared
CONFIGURE_OPTIONS     +=	--enable-wddx=shared
CONFIGURE_OPTIONS     +=	--enable-zip=shared

CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(BITS))

CONFIGURE_OPTIONS += $(CONFIGURE_VARIANT_OPTIONS)

COMPONENT_POST_CONFIGURE_ACTION_64= \
	( cd $(@D) ; $(GSED) -i -e 's!-L[ ]*/ec/lib!-L/ec/lib/amd64!g' -e 's!-R[ ]*/ec/lib!-R/ec/lib/amd64!g' Makefile )
COMPONENT_POST_CONFIGURE_ACTION= \
	( cd $(@D) ; $(GSED) -i '/EXTRA_LIBS = /s|$$| -lstdc++|' Makefile ); \
	$(COMPONENT_POST_CONFIGURE_ACTION_$(BITS))

# Installation Arguments
COMPONENT_INSTALL_ARGS  += INSTALL_ROOT=$(PROTO_DIR)

# Pre-Install Actions
COMPONENT_PRE_INSTALL_ACTION+= \
	( $(MKDIR) -p $(PROTO_DIR)/$(AP_SYSCONFDIR) ; \
	  echo "Creating fake httpd.conf" ; \
	  echo "ServerName ignoremeLoad" > $(PROTO_DIR)/$(AP_SYSCONFDIR)/httpd.conf ; \
	  echo "Listen 0.0.0.0:80" >> $(PROTO_DIR)/$(AP_SYSCONFDIR)/httpd.conf ; \
	  echo "LoadModule foo foo/bar.so" >> $(PROTO_DIR)/$(AP_SYSCONFDIR)/httpd.conf \
	)

# Environment Variables
COMPONENT_BUILD_ENV+=	CC="$(CC)" CXX="$(CCC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
CONFIGURE_ENV.32 +=     EXTENSION_DIR=$(PHP_PREFIX)/extensions
CONFIGURE_ENV.64 +=     EXTENSION_DIR=$(PHP_PREFIX)/extensions/$(MACH64)

# Standard build
$(BUILD_DIR_32)/.configured:	CONFIGURE_VARIANT_OPTIONS= \
    --with-apxs2=$(AP_PREFIX)/bin/apxs
$(BUILD_DIR_64)/.configured:	CONFIGURE_VARIANT_OPTIONS= \
    --with-apxs2=$(AP_PREFIX)/bin/$(MACH64)/apxs

# CGI build
$(BUILD_DIR)/$(MACH32).cgi/.configured:     BITS=32
$(BUILD_DIR)/$(MACH64).cgi/.configured:     BITS=64
$(BUILD_DIR)/$(MACH32).cgi/.configured:     CONFIGURE_VARIANT_OPTIONS= --enable-cgi
$(BUILD_DIR)/$(MACH64).cgi/.configured:     CONFIGURE_VARIANT_OPTIONS= --enable-cgi
$(BUILD_DIR)/$(MACH32).cgi/.built:          BITS=32
$(BUILD_DIR)/$(MACH64).cgi/.built:          BITS=64
$(BUILD_DIR)/$(MACH32).cgi/.installed:      BITS=32
$(BUILD_DIR)/$(MACH64).cgi/.installed:      BITS=64

# FPM build
$(BUILD_DIR)/$(MACH32).fpm/.configured:     BITS=32
$(BUILD_DIR)/$(MACH64).fpm/.configured:     BITS=64
$(BUILD_DIR)/$(MACH32).fpm/.configured:     CONFIGURE_VARIANT_OPTIONS= --enable-fpm
$(BUILD_DIR)/$(MACH64).fpm/.configured:     CONFIGURE_VARIANT_OPTIONS= --enable-fpm
$(BUILD_DIR)/$(MACH32).fpm/.built:          BITS=32
$(BUILD_DIR)/$(MACH64).fpm/.built:          BITS=64
$(BUILD_DIR)/$(MACH32).fpm/.installed:      BITS=32
$(BUILD_DIR)/$(MACH64).fpm/.installed:      BITS=64


build:		$(BUILD_32_and_64) \
    $(BUILD_DIR)/$(MACH32).cgi/.built \
    $(BUILD_DIR)/$(MACH64).cgi/.built \
    $(BUILD_DIR)/$(MACH32).fpm/.built \
    $(BUILD_DIR)/$(MACH64).fpm/.built

install:	$(INSTALL_32_and_64)
	$(CP) $(BUILD_DIR)/$(MACH32).cgi/sapi/cgi/php-cgi $(PROTO_DIR)$(PHP_PREFIX)/bin
	$(CP) $(BUILD_DIR)/$(MACH64).cgi/sapi/cgi/php-cgi $(PROTO_DIR)$(PHP_PREFIX)/bin/$(MACH64)
	$(CP) $(BUILD_DIR)/$(MACH32).fpm/sapi/fpm/php-fpm $(PROTO_DIR)$(PHP_PREFIX)/bin
	$(CP) $(BUILD_DIR)/$(MACH64).fpm/sapi/fpm/php-fpm $(PROTO_DIR)$(PHP_PREFIX)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(PHP_PREFIX)/share/man/man8
	$(CP) $(BUILD_DIR)/$(MACH32).fpm/sapi/fpm/php-fpm.8 $(PROTO_DIR)$(PHP_PREFIX)/share/man/man8
	$(CP) $(BUILD_DIR)/$(MACH32).fpm/sapi/fpm/php-fpm.conf $(PROTO_DIR)$(PHP_SYSCONFDIR)/php-fpm.conf.default
	$(MKDIR) $(PROTO_DIR)$(PHP_DATADIR)/fpm
	$(CP) $(BUILD_DIR)/$(MACH32).fpm/sapi/fpm/status.html $(PROTO_DIR)$(PHP_DATADIR)/fpm
