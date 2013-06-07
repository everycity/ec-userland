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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
# Copyright 2011 Audioboo Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		sphinx
COMPONENT_VERSION=	0.9.9
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:bf8f55ffc095ff6b628f0cbc7eb54761811140140679a1c869cc1b17c42803e4
COMPONENT_ARCHIVE_URL=	http://sphinxsearch.com/files/archive/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS +=	-liconv
LDFLAGS.32+=	-L$(ECPREFIX)/lib/mysql/5.5/lib -R$(ECPREFIX)/lib/mysql/5.5/lib
LDFLAGS.64+=	-L$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64) -R$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64)
LDFLAGS.32+=	-L$(ECPREFIX)/lib/postgres/9.1/lib -R$(ECPREFIX)/lib/postgres/9.1/lib
LDFLAGS.64+=	-L$(ECPREFIX)/lib/postgres/9.1/lib/$(MACH64) -R$(ECPREFIX)/lib/postgres/9.1/lib/$(MACH64)

CONFIGURE_OPTIONS+=	--with-iconv
CONFIGURE_OPTIONS+=	--enable-debug
CONFIGURE_OPTIONS.64+=	--enable-id64
CONFIGURE_OPTIONS+=	--with-mysql
CONFIGURE_OPTIONS+=	--with-mysql-includes=$(ECPREFIX)/lib/mysql/5.5/include
CONFIGURE_OPTIONS.32+=	--with-mysql-libs=$(ECPREFIX)/lib/mysql/5.5/lib
CONFIGURE_OPTIONS.64+=	--with-mysql-libs=$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64)
CONFIGURE_OPTIONS+=	--with-pgsql
CONFIGURE_OPTIONS+=	--with-pgsql-includes=$(ECPREFIX)/lib/postgres/9.1/include
CONFIGURE_OPTIONS.32+=	--with-pgsql-libs=$(ECPREFIX)/lib/postgres/9.1/lib
CONFIGURE_OPTIONS.64+=	--with-pgsql-libs=$(ECPREFIX)/lib/postgres/9.1/lib/$(MACH64)

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


