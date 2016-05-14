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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		postgresql
COMPONENT_MJR_VERSION=	9.2
COMPONENT_MNR_VERSION=	17
COMPONENT_VERSION=	$(COMPONENT_MJR_VERSION).$(COMPONENT_MNR_VERSION)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:c660cc0ee42c221ebedc2c75ad0d4b30ec8da488a954df9987a3fc83bcb7363f
COMPONENT_ARCHIVE_URL=	http://ftp.postgresql.org/pub/source/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_PREFIX=	$(ECPREFIX)/lib/postgres/$(COMPONENT_MJR_VERSION)
CONFIGURE_SYSCONFDIR=	$(ECPREFIX)/etc/postgres/$(COMPONENT_MJR_VERSION)
CONFIGURE_LOCALSTATEDIR=	$(ECPREFIX)/var/postgres/$(COMPONENT_MJR_VERSION)
PKG_MACROS+=	COMPONENT_MJR_VERSION=$(COMPONENT_MJR_VERSION)

PATH=	$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin:/usr/sbin

CONFIGURE_OPTIONS +=	'LIBS=-lintl'

# DTrace probes only build/work on newer Solaris
ifeq ($(SOLARIS_VERSION),2.11)
CONFIGURE_OPTIONS +=	--enable-dtrace
else
CONFIGURE_OPTIONS +=    --disable-dtrace
endif

CONFIGURE_OPTIONS +=	--enable-nls
CONFIGURE_OPTIONS +=	--enable-thread-safety
CONFIGURE_OPTIONS +=	--enable-integer-datetimes
CONFIGURE_OPTIONS +=	--with-system-tzdata=/usr/share/lib/zoneinfo
CONFIGURE_OPTIONS +=	--with-pam
CONFIGURE_OPTIONS +=	--with-libedit-preferred
CONFIGURE_OPTIONS +=	--with-gssapi
CONFIGURE_OPTIONS +=	--with-perl
CONFIGURE_OPTIONS +=	--with-python
CONFIGURE_OPTIONS +=	--with-ldap
CONFIGURE_OPTIONS +=	--with-openssl
CONFIGURE_OPTIONS +=	--with-libxml
CONFIGURE_OPTIONS +=	--with-libxslt

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) ; autoreconf )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
	( cd $(BUILD_DIR_32)/contrib/pgbench && make && \
		cp pgbench $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/bin/ )
	( cd $(BUILD_DIR_64)/contrib/pgbench && make && \
		cp pgbench $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/bin/$(MACH64) )

