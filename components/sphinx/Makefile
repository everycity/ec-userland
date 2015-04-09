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
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2015 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		sphinx
COMPONENT_FMRI=		database/search/sphinx
COMPONENT_VERSION=	2.2.8
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://sphinxsearch.com/"
COMPONENT_SUMMARY=	Sphinx is an open source full text search server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)-release
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:fb5635e6927c2f0a3aa8259d3494fd683d17cba293439778646706f40a6fd2e0
COMPONENT_ARCHIVE_URL=	http://sphinxsearch.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS +=	-liconv
LDFLAGS.32+=	-L$(ECPREFIX)/lib/mysql/5.5/lib -R$(ECPREFIX)/lib/mysql/5.5/lib
LDFLAGS.64+=	-L$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64) -R$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64)
LDFLAGS.32+=	-L$(ECPREFIX)/lib/postgres/9.3/lib -R$(ECPREFIX)/lib/postgres/9.3/lib
LDFLAGS.64+=	-L$(ECPREFIX)/lib/postgres/9.3/lib/$(MACH64) -R$(ECPREFIX)/lib/postgres/9.3/lib/$(MACH64)

CONFIGURE_OPTIONS+=	--with-iconv
CONFIGURE_OPTIONS+=	--with-mysql
CONFIGURE_OPTIONS+=	--with-mysql-includes=$(ECPREFIX)/lib/mysql/5.5/include
CONFIGURE_OPTIONS.32+=	--with-mysql-libs=$(ECPREFIX)/lib/mysql/5.5/lib
CONFIGURE_OPTIONS.64+=	--with-mysql-libs=$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64)
CONFIGURE_OPTIONS+=	--with-pgsql
CONFIGURE_OPTIONS+=	--with-pgsql-includes=$(ECPREFIX)/lib/postgres/9.3/include
CONFIGURE_OPTIONS.32+=	--with-pgsql-libs=$(ECPREFIX)/lib/postgres/9.3/lib
CONFIGURE_OPTIONS.64+=	--with-pgsql-libs=$(ECPREFIX)/lib/postgres/9.3/lib/$(MACH64)

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


