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
COMPONENT_MJR_VERSION=	9.5
COMPONENT_MNR_VERSION=	5
COMPONENT_VERSION=	$(COMPONENT_MJR_VERSION).$(COMPONENT_MNR_VERSION)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:02c65290be74de6604c3fed87c9fd3e6b32e949f0ab8105a75bd7ed5aa71f394
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
#CONFIGURE_OPTIONS.32 +=	--with-perl
CONFIGURE_OPTIONS +=	--without-perl
CONFIGURE_OPTIONS +=	--with-python
CONFIGURE_OPTIONS +=	--with-ldap
CONFIGURE_OPTIONS +=	--with-openssl
CONFIGURE_OPTIONS +=	--with-libxml
CONFIGURE_OPTIONS +=	--with-libxslt
CONFIGURE_OPTIONS +=	--with-uuid=e2fs

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) ; autoreconf )

build:		$(BUILD_64)

$(BUILD_DIR)/.installed:        $(INSTALL_64)
	#( cd $(BUILD_DIR_32)/contrib/hstore && make && \
	#	cp hstore.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/ )
	( cd $(BUILD_DIR_64)/contrib/hstore && make && \
		cp hstore.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/$(MACH64) )
	#( cd $(BUILD_DIR_32)/contrib/pgcrypto && make && \
	#	cp pgcrypto.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/ )
	( cd $(BUILD_DIR_64)/contrib/pgcrypto && make && \
		cp pgcrypto.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/$(MACH64) )
	#( cd $(BUILD_DIR_32)/contrib/tablefunc && make && \
	#	cp tablefunc.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/ )
	( cd $(BUILD_DIR_64)/contrib/tablefunc && make && \
		cp tablefunc.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/$(MACH64) )
	#( cd $(BUILD_DIR_32)/contrib/uuid-ossp && make && \
	#	cp uuid-ossp.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/ )
	( cd $(BUILD_DIR_64)/contrib/uuid-ossp && make && \
		cp uuid-ossp.so $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/lib/$(MACH64) )
	$(MKDIR) $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/extension
	$(CP) $(SOURCE_DIR)/contrib/hstore/hstore--1.0--1.1.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/hstore/hstore--1.1--1.2.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/hstore/hstore--1.2--1.3.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/hstore/hstore--1.3.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/hstore/hstore--unpackaged--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/hstore/hstore.control $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/pgcrypto/pgcrypto--1.0--1.1.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/pgcrypto/pgcrypto--1.1--1.2.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/pgcrypto/pgcrypto--1.2.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/pgcrypto/pgcrypto--unpackaged--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/pgcrypto/pgcrypto.control $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/tablefunc/tablefunc--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/tablefunc/tablefunc--unpackaged--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/tablefunc/tablefunc.control $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/uuid-ossp/uuid-ossp--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/uuid-ossp/uuid-ossp--unpackaged--1.0.sql $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(CP) $(SOURCE_DIR)/contrib/uuid-ossp/uuid-ossp.control $(BUILD_DIR)/prototype/$(MACH)$(CONFIGURE_PREFIX)/share/extension
	$(TOUCH) $@

install:        $(BUILD_DIR)/.installed

