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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		postgresql
COMPONENT_MJR_VERSION=	9.1
COMPONENT_MNR_VERSION=	16
COMPONENT_VERSION=	$(COMPONENT_MJR_VERSION).$(COMPONENT_MNR_VERSION)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:2b65e2f7d6171107b96d3e92f42b869ec21f3b4e920d8941e511111372909456
COMPONENT_ARCHIVE_URL=	http://ftp.postgresql.org/pub/source/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_PREFIX=	$(USRDIR)/lib/postgres/$(COMPONENT_MJR_VERSION)
CONFIGURE_SYSCONFDIR.ec= /ec/etc/postgres/$(COMPONENT_MJR_VERSION)
CONFIGURE_SYSCONFDIR.nonec= /etc/postgres/$(COMPONENT_MJR_VERSION)
CONFIGURE_SYSCONFDIR = $(CONFIGURE_SYSCONFDIR.$(ZTYPE))
CONFIGURE_LOCALSTATEDIR.ec= /ec/var/postgres/$(COMPONENT_MJR_VERSION)
CONFIGURE_LOCALSTATEDIR.nonec= /var/postgres/$(COMPONENT_MJR_VERSION)
CONFIGURE_LOCALSTATEDIR = $(CONFIGURE_LOCALSTATEDIR.$(ZTYPE))
PKG_MACROS+=	COMPONENT_MJR_VERSION=$(COMPONENT_MJR_VERSION)

# DTrace probes only build/work on newer Solaris
ifeq ($(SOLARIS_VERSION),2.11)
CONFIGURE_OPTIONS +=	--enable-dtrace
else
CONFIGURE_OPTIONS +=    --disable-dtrace
endif

CONFIGURE_ENV += PYTHON="$(PYTHON.$(BITS))"

CONFIGURE_OPTIONS +=	--enable-nls
CONFIGURE_OPTIONS +=	--enable-thread-safety
CONFIGURE_OPTIONS +=	--enable-integer-datetimes
CONFIGURE_OPTIONS +=	--with-system-tzdata=$(USRDIR)/share/lib/zoneinfo
CONFIGURE_OPTIONS +=	--with-pam
CONFIGURE_OPTIONS +=	--with-libedit-preferred
CONFIGURE_OPTIONS +=	--with-gssapi
CONFIGURE_OPTIONS.64 +=	--with-perl
CONFIGURE_OPTIONS +=	--with-python
CONFIGURE_OPTIONS +=	--with-ldap
CONFIGURE_OPTIONS +=	--with-openssl
CONFIGURE_OPTIONS +=	--with-libxml
CONFIGURE_OPTIONS +=	--with-libxslt

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) ; autoreconf )

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	( cd $(BUILD_DIR_32)/contrib/pgbench && make && \
		cp pgbench $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/bin/ )
	( cd $(BUILD_DIR_64)/contrib/pgbench && make && \
		cp pgbench $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/bin/$(MACH64) )
	( cd $(BUILD_DIR_32)/contrib/pgcrypto && make && \
		cp pgcrypto.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/ )
	( cd $(BUILD_DIR_64)/contrib/pgcrypto && make && \
		cp pgcrypto.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/$(MACH64) )
	( cd $(BUILD_DIR_32)/contrib/tablefunc && make && \
		cp tablefunc.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/ )
	( cd $(BUILD_DIR_64)/contrib/tablefunc && make && \
		cp tablefunc.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/$(MACH64) )
	$(MKDIR) $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/extension
	$(CP) $(SOURCE_DIR)/contrib/pgcrypto/pgcrypto--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/pgcrypto/pgcrypto--unpackaged--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/pgcrypto/pgcrypto.control $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/tablefunc/tablefunc--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/tablefunc/tablefunc--unpackaged--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/tablefunc/tablefunc.control $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

