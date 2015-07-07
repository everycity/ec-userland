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

COMPONENT_NAME=		dovecot
COMPONENT_FMRI=		mail/dovecot
COMPONENT_VERSION=	2.2.16
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://dovecot.org/"
COMPONENT_SUMMARY=	Dovecot IMAP Server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:56ce1287a17fa88a2083116db00200deff1a5390af5eac1c8ae3f59a2079cff0
COMPONENT_ARCHIVE_URL=	http://www.dovecot.org/releases/2.2/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# Encode runpaths for MySQL and Postgresql
LDFLAGS.32+=    -L$(USRDIR)/lib/mysql/5.5/lib -R$(USRDIR)/lib/mysql/5.5/lib
LDFLAGS.64+=    -L$(USRDIR)/lib/mysql/5.5/lib/$(MACH64) -R$(USRDIR)/lib/mysql/5.5/lib/$(MACH64)
LDFLAGS.32+=    -L$(USRDIR)/lib/postgres/9.3/lib -R$(USRDIR)/lib/postgres/9.3/lib
LDFLAGS.64+=    -L$(USRDIR)/lib/postgres/9.3/lib/$(MACH64) -R$(USRDIR)/lib/postgres/9.3/lib/$(MACH64)

# Dovecot doesn't seem to want to support libdir==libexecdir
# http://www.dovecot.org/list/dovecot/2009-December/045498.html
CONFIGURE_OPTIONS+=	--libexecdir=$(USRDIR)/libexec

CONFIGURE_OPTIONS.32+=	--sbindir=$(USRDIR)/bin
CONFIGURE_OPTIONS.64+=	--sbindir=$(USRDIR)/bin/$(MACH64)
CONFIGURE_OPTIONS+=	--with-mysql
CONFIGURE_OPTIONS+=	--with-pgsql
CONFIGURE_OPTIONS+=	--with-sqlite
CONFIGURE_OPTIONS+=	--with-zlib

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

