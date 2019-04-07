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
# Copyright 2019, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		apr-util
COMPONENT_FMRI=		library/apr-util-15
COMPONENT_VERSION=	1.6.1
COMPONENT_LICENSE=	APLv2
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=	"http://apr.apache.org/"
COMPONENT_SUMMARY=	Apache Portable Runtime Utility (APR-util) 1.3
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b
COMPONENT_ARCHIVE_URL=	$(APACHE_ARCHIVE)/apr/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PATH.32 =	$(USRDIR)/lib/postgres/9.6/bin:$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64 =	$(USRDIR)/lib/postgres/9.6/bin/$(MACH64):$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH =	$(PATH.$(BITS))

LDFLAGS += $(CC_BITS)

CONFIGURE_OPTIONS	+=	--with-ldap
#CONFIGURE_OPTIONS.32	+=	--includedir=$(USRDIR)/include/apr-1.0
#CONFIGURE_OPTIONS.64	+=	--includedir=$(USRDIR)/include/apr-1.0/$(MACH64)
CONFIGURE_OPTIONS	+=	--includedir=$(USRDIR)/include/apr-1.0
CONFIGURE_OPTIONS.32	+=	--with-apr=$(USRDIR)/bin/apr-1-config
CONFIGURE_OPTIONS.64	+=	--with-apr=$(USRDIR)/bin/$(MACH64)/apr-1-config

CONFIGURE_OPTIONS += --with-sqlite3
CONFIGURE_OPTIONS += --with-berkeley-db
#CONFIGURE_OPTIONS += --with-ldap=ldap_r-2.4
#CONFIGURE_OPTIONS += --with-ldap-include=/usr/include/openldap
CONFIGURE_OPTIONS += --with-crypto
CONFIGURE_OPTIONS += --without-gdbm
CONFIGURE_OPTIONS += --without-sqlite2
CONFIGURE_OPTIONS += --with-dbm=db

# We need this to keep doxygen happy (for include/ and docs/ contents).
COMPONENT_PRE_CONFIGURE_ACTION += ($(CLONEY) $(SOURCE_DIR) $(@D));

# Some patches need configure script recreation.
COMPONENT_PRE_CONFIGURE_ACTION.32 += \
	(cd $(@D); \
	./buildconf --with-apr=$(shell $(USRDIR)/bin/apr-1-config --srcdir));

COMPONENT_PRE_CONFIGURE_ACTION.64 += \
	(cd $(@D); \
	./buildconf --with-apr=$(shell $(USRDIR)/bin/$(MACH64)/apr-1-config --srcdir));

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
