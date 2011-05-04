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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		php
COMPONENT_VERSION=	5.2.17
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:5ba7edcb5ea187687001c4ccdbb94ac48f77fa92
COMPONENT_ARCHIVE_URL=	http://uk2.php.net/get/$(COMPONENT_ARCHIVE)/from/this/mirror

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# Apache Paths
AP_PREFIX=$(ECPREFIX)/lib/apache2/2.2
AP_SYSCONFDIR=$(ECPREFIX)/etc/apache2/2.2

# PHP Paths
PHP_PREFIX=$(ECPREFIX)/lib/php5/5.2
PHP_SYSCONFDIR=$(ECPREFIX)/etc/php5/5.2
PHP_DATADIR=$(ECPREFIX)/var/php5/5.2

# Configure Options
CONFIGURE_OPTIONS      = --prefix=$(CONFIGURE_PREFIX)
CONFIGURE_OPTIONS     += --mandir=$(CONFIGURE_MANDIR)
CONFIGURE_OPTIONS     += --bindir=$(CONFIGURE_BINDIR.$(BITS))
CONFIGURE_OPTIONS     += --libdir=$(CONFIGURE_LIBDIR.$(BITS))
CONFIGURE_OPTIONS     += --sbindir=$(CONFIGURE_SBINDIR.$(BITS))

CONFIGURE_OPTIONS     +=	--prefix=$(PHP_PREFIX)
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

CONFIGURE_OPTIONS.32  +=	--with-apxs2=$(AP_PREFIX)/bin/apxs
CONFIGURE_OPTIONS.64  +=	--with-apxs2=$(AP_PREFIX)/bin/amd64/apxs

CONFIGURE_OPTIONS.64  +=	--build=x86_64-pc-solaris2.10

CONFIGURE_OPTIONS     +=	--with-config-file-path=$(PHP_SYSCONFDIR)
CONFIGURE_OPTIONS     +=	--with-config-file-scan-dir=$(PHP_SYSCONFDIR)/conf.d
CONFIGURE_OPTIONS     +=	--with-pear=$(PHP_PREFIX)/share/PEAR

CONFIGURE_OPTIONS     +=	--with-layout=PHP
CONFIGURE_OPTIONS     +=	--with-zend-vm=CALL

CONFIGURE_OPTIONS     +=	--with-cdb
CONFIGURE_OPTIONS     +=	--with-kerberos
CONFIGURE_OPTIONS     +=	--with-pcre-regex

# Shared Extensions
CONFIGURE_OPTIONS     +=	--with-bz2=shared
CONFIGURE_OPTIONS     +=	--with-iconv=shared
CONFIGURE_OPTIONS     +=	--with-curlwrappers
CONFIGURE_OPTIONS     +=	--with-gettext=shared
CONFIGURE_OPTIONS     +=	--with-xmlrpc=shared
CONFIGURE_OPTIONS     +=	--with-gd=shared
CONFIGURE_OPTIONS     +=	--with-zlib=shared
CONFIGURE_OPTIONS     +=	--with-openssl=shared
CONFIGURE_OPTIONS     +=	--with-pdo-sqlite=shared
CONFIGURE_OPTIONS     +=	--with-sqlite=shared

# Shared Extensions
CONFIGURE_OPTIONS     +=	--with-tidy=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-mhash=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-mcrypt=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-xsl=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-curl=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-readline=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-pspell=shared,$(ECPREFIX)
CONFIGURE_OPTIONS     +=	--with-imap-ssl=shared,$(ECPREFIX)

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

CONFIGURE_OPTIONS     +=	--without-dbm
CONFIGURE_OPTIONS     +=	--without-t1lib

# Enabled extensions
CONFIGURE_OPTIONS     +=	--enable-cli
CONFIGURE_OPTIONS     +=	--enable-cgi
CONFIGURE_OPTIONS     +=	--enable-shared
CONFIGURE_OPTIONS     +=	--enable-filter
CONFIGURE_OPTIONS     +=	--enable-gd-jis-conv
CONFIGURE_OPTIONS     +=	--enable-magic-quotes
CONFIGURE_OPTIONS     +=	--enable-short-tags
CONFIGURE_OPTIONS     +=	--enable-zend-multibyte
CONFIGURE_OPTIONS     +=	--enable-discard-path
CONFIGURE_OPTIONS     +=	--enable-pcntl
CONFIGURE_OPTIONS     +=	--enable-shmop
CONFIGURE_OPTIONS     +=	--enable-sqlite-utf8
CONFIGURE_OPTIONS     +=	--enable-sysvmsg
CONFIGURE_OPTIONS     +=	--enable-sysvsem
CONFIGURE_OPTIONS     +=	--enable-sysvshm
CONFIGURE_OPTIONS     +=	--enable-spl
CONFIGURE_OPTIONS     +=	--enable-simplexml
CONFIGURE_OPTIONS     +=	--enable-hash
CONFIGURE_OPTIONS     +=	--enable-session

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

# Post-Install Actions
COMPONENT_POST_INSTALL_ACTION+= \
	( $(MKDIR) -p $(PROTO_DIR)/$(PHP_SYSCONFDIR)/conf.d ; \
	  $(MKDIR) -p $(PROTO_DIR)/$(AP_SYSCONFDIR)/mods-available ; \
	  $(CP) $(COMPONENT_DIR)/files/*.ini $(PROTO_DIR)/$(PHP_SYSCONFDIR)/conf.d/ ; \
	  $(CP) $(COMPONENT_DIR)/files/php52.conf $(PROTO_DIR)/$(AP_SYSCONFDIR)/mods-available/ ; \
	  $(CP) $(COMPONENT_DIR)/files/php52.load $(PROTO_DIR)/$(AP_SYSCONFDIR)/mods-available/ \
	)

# Environment Variables
COMPONENT_BUILD_ENV+=	"CC=$(CC)" "CXX=$(CCC)"
CONFIGURE_ENV+=	"CC=$(CC)" "CXX=$(CCC)"

# configure the unpacked source for building 32 and 64 bit version
CONFIGURE_SCRIPT =	$(SOURCE_DIR)/configure
$(BUILD_DIR)/%/.configured:	$(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CONFIG_SHELL) \
		$(CONFIGURE_SCRIPT) $(CONFIGURE_OPTIONS))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

# build the configured source
$(BUILD_DIR)/%/.built:  $(BUILD_DIR)/%/.configured
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(GMAKE) -j16 $(COMPONENT_BUILD_ARGS) $(COMPONENT_BUILD_TARGETS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
