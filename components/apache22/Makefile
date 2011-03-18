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

GMAKE=gmake -j16

COMPONENT_NAME=		httpd
COMPONENT_VERSION=	2.2.17
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:5c9b44620dee449a86ba1bcba1715033c2c26b08
COMPONENT_ARCHIVE_URL=	http://apache.cs.utah.edu//httpd/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS=-I$(ECPREFIX)/apr/1.4/include/apr-1 -I$(ECPREFIX)/apr-util/1.3/include/apr-1
CONFIGURE_ENV += CPPFLAGS="$(CPPFLAGS)"

AP_PREFIX=$(ECPREFIX)/apache2/2.2
AP_SYSCONFDIR=$(ECPREFIX)/etc/apache2/2.2
AP_DATADIR=$(ECPREFIX)/var/apache2/2.2

# -L/ec/lib gets added to EXTRA_LDFLAGS for some reason, removing it as otherwise 64-bit build fails
COMPONENT_POST_CONFIGURE_ACTION += (cd $(@D); gsed -i s/\^EXTRA_LDFLAGS.*// build/config_vars.mk)

CONFIGURE_OPTIONS     +=	--prefix=$(AP_PREFIX)

CONFIGURE_OPTIONS.32  +=	--bindir=$(AP_PREFIX)/bin
CONFIGURE_OPTIONS.64  +=	--bindir=$(AP_PREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32  +=	--sbindir=$(AP_PREFIX)/bin
CONFIGURE_OPTIONS.64  +=	--sbindir=$(AP_PREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32  +=	--libdir=$(AP_PREFIX)/lib
CONFIGURE_OPTIONS.64  +=	--libdir=$(AP_PREFIX)/lib/$(MACH64)
CONFIGURE_OPTIONS.32  +=	--libexecdir=$(AP_PREFIX)/libexec
CONFIGURE_OPTIONS.64  +=	--libexecdir=$(AP_PREFIX)/libexec/$(MACH64)
CONFIGURE_OPTIONS     +=	--includedir=$(AP_PREFIX)/include
CONFIGURE_OPTIONS     +=	--sysconfdir=$(AP_SYSCONFDIR)
CONFIGURE_OPTIONS     +=	--datadir=$(AP_DATADIR)

CONFIGURE_OPTIONS.32  +=	--with-pcre=$(ECPREFIX)/bin/pcre-config
CONFIGURE_OPTIONS.64  +=	--with-pcre=$(ECPREFIX)/bin/$(MACH64)/pcre-config
CONFIGURE_OPTIONS.32  +=	--with-apr=$(ECPREFIX)/apr/1.4/bin/apr-1-config
CONFIGURE_OPTIONS.64  +=	--with-apr=$(ECPREFIX)/apr/1.4/bin/$(MACH64)/apr-1-config
CONFIGURE_OPTIONS.32  +=	--with-apr-util=$(ECPREFIX)/apr-util/1.3/bin/apu-1-config
CONFIGURE_OPTIONS.64  +=	--with-apr-util=$(ECPREFIX)/apr-util/1.3/bin/$(MACH64)/apu-1-config

CONFIGURE_OPTIONS  +=	--enable-mods-shared=all
CONFIGURE_OPTIONS  +=	--enable-so
CONFIGURE_OPTIONS  +=	--enable-suexec
CONFIGURE_OPTIONS  +=	--with-suexec-caller=webservd
CONFIGURE_OPTIONS  +=	--enable-proxy
CONFIGURE_OPTIONS  +=	--enable-proxy-connect
CONFIGURE_OPTIONS  +=	--enable-proxy-ftp
CONFIGURE_OPTIONS  +=	--enable-proxy-http
CONFIGURE_OPTIONS  +=	--enable-proxy-ajp
CONFIGURE_OPTIONS  +=	--enable-proxy-balancer
CONFIGURE_OPTIONS  +=	--enable-cache
CONFIGURE_OPTIONS  +=	--enable-file-cache
CONFIGURE_OPTIONS  +=	--enable-disk-cache
CONFIGURE_OPTIONS  +=	--enable-mem-cache
CONFIGURE_OPTIONS  +=	--enable-deflate
CONFIGURE_OPTIONS  +=	--enable-cgid
CONFIGURE_OPTIONS  +=	--enable-cgi
CONFIGURE_OPTIONS  +=	--enable-authnz-ldap
CONFIGURE_OPTIONS  +=	--enable-ldap
CONFIGURE_OPTIONS  +=	--enable-ssl
CONFIGURE_OPTIONS  +=	--enable-exception-hook

CONFIGURE_OPTIONS  +=	--with-mpm=$(MPM)


$(BUILD_DIR)/$(MACH32).worker/.configured:     BITS=32
$(BUILD_DIR)/$(MACH64).worker/.configured:     BITS=64
$(BUILD_DIR)/$(MACH32).worker/.configured:     MPM=worker
$(BUILD_DIR)/$(MACH64).worker/.configured:     MPM=worker
$(BUILD_DIR)/$(MACH32).worker/.built:          BITS=32
$(BUILD_DIR)/$(MACH64).worker/.built:          BITS=64
$(BUILD_DIR)/$(MACH32).worker/.installed:      BITS=32
$(BUILD_DIR)/$(MACH64).worker/.installed:      BITS=64

$(BUILD_DIR)/$(MACH32).prefork/.configured:     BITS=32
$(BUILD_DIR)/$(MACH64).prefork/.configured:     BITS=64
$(BUILD_DIR)/$(MACH32).prefork/.configured:     MPM=prefork
$(BUILD_DIR)/$(MACH64).prefork/.configured:     MPM=prefork
$(BUILD_DIR)/$(MACH32).prefork/.built:          BITS=32
$(BUILD_DIR)/$(MACH64).prefork/.built:          BITS=64
$(BUILD_DIR)/$(MACH32).prefork/.installed:      BITS=32
$(BUILD_DIR)/$(MACH64).prefork/.installed:      BITS=64


build:		$(BUILD_DIR)/$(MACH32).prefork/.built \
		$(BUILD_DIR)/$(MACH64).prefork/.built \
		$(BUILD_DIR)/$(MACH32).worker/.built \
		$(BUILD_DIR)/$(MACH64).worker/.built

install:	$(BUILD_DIR)/$(MACH32).prefork/.installed \
		$(BUILD_DIR)/$(MACH64).prefork/.installed
	$(CP) -f $(BUILD_DIR)/$(MACH32).worker/httpd $(PROTO_DIR)/$(AP_PREFIX)/bin/httpd.worker
	$(CP) -f $(BUILD_DIR)/$(MACH64).worker/httpd $(PROTO_DIR)/$(AP_PREFIX)/bin/$(MACH64)/httpd.worker

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
