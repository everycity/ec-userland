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
# Copyright 2011-2014, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		apr-util
COMPONENT_FMRI=		library/apr-util-15
COMPONENT_VERSION=	1.5.4
COMPONENT_LICENSE=	APLv2
COMPONENT_PROJECT_URL=	"http://apr.apache.org/"
COMPONENT_SUMMARY=	Apache Portable Runtime Utility (APR-util) 1.3
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:a6cf327189ca0df2fb9d5633d7326c460fe2b61684745fd7963e79a6dd0dc82e
COMPONENT_ARCHIVE_URL=	$(APACHE_ARCHIVE)/apr/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PATH.32 =	$(USRDIR)/lib/postgres/9.3/bin:$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64 =	$(USRDIR)/lib/postgres/9.3/bin/$(MACH64):$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH =	$(PATH.$(BITS))

CONFIGURE_OPTIONS	+=	--with-ldap
CONFIGURE_OPTIONS.32	+=	--includedir=$(USRDIR)/include/apr-1.0
CONFIGURE_OPTIONS.64	+=	--includedir=$(USRDIR)/include/apr-1.0/$(MACH64)
CONFIGURE_OPTIONS.32	+=	--with-apr=$(USRDIR)/bin/apr-1-config
CONFIGURE_OPTIONS.64	+=	--with-apr=$(USRDIR)/bin/$(MACH64)/apr-1-config

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
