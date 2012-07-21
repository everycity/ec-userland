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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lighttpd
COMPONENT_MJR_VERSION=	1.4
COMPONENT_MNR_VERSION=	31
COMPONENT_VERSION=	$(COMPONENT_MJR_VERSION).$(COMPONENT_MNR_VERSION)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:848a15604bf358d9355bd7a48c01f448c286734dbb5f4dc1cd16acb8b05a9b52
COMPONENT_ARCHIVE_URL=	http://download.lighttpd.net/lighttpd/releases-$(COMPONENT_MJR_VERSION).x/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_PREFIX=	$(ECPREFIX)/lib/lighttpd/$(COMPONENT_MJR_VERSION)
CONFIGURE_SYSCONFDIR=	$(ECPREFIX)/etc/lighttpd/$(COMPONENT_MJR_VERSION)
CONFIGURE_LOCALSTATEDIR=	$(ECPREFIX)/var/lighttpd/$(COMPONENT_MJR_VERSION)
PKG_MACROS+=	LIGHTTPD_MAJOR=$(COMPONENT_MJR_VERSION)

CONFIGURE_OPTIONS+=	--with-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--with-zlib
CONFIGURE_OPTIONS+=	--with-bzip2
CONFIGURE_OPTIONS+=	--with-openssl
CONFIGURE_OPTIONS+=	--with-pcre
CONFIGURE_OPTIONS.32+=	--with-mysql=$(ECPREFIX)/bin/mysql_config
CONFIGURE_OPTIONS.64+=	--with-mysql=$(ECPREFIX)/bin/$(MACH64)/mysql_config

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

