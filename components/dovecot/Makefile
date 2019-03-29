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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		dovecot
COMPONENT_FMRI=		mail/dovecot
COMPONENT_VERSION=	2.2.36.3
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://dovecot.org/"
COMPONENT_SUMMARY=	Dovecot IMAP Server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:992521305fa1d61f4726aac2619ccc65094a3cc2e5c80644455199764305863e
COMPONENT_ARCHIVE_URL=	https://www.dovecot.org/releases/2.2/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-lnsl

# Encode runpaths for MySQL and Postgresql
LDFLAGS.32+=    -L$(ECPREFIX)/lib/mysql/5.5/lib -R$(ECPREFIX)/lib/mysql/5.5/lib
LDFLAGS.64+=    -L$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64) -R$(ECPREFIX)/lib/mysql/5.5/lib/$(MACH64)
LDFLAGS.32+=    -L$(ECPREFIX)/lib/postgres/9.3/lib -R$(ECPREFIX)/lib/postgres/9.3/lib
LDFLAGS.64+=    -L$(ECPREFIX)/lib/postgres/9.3/lib/$(MACH64) -R$(ECPREFIX)/lib/postgres/9.3/lib/$(MACH64)

# Dovecot doesn't seem to want to support libdir==libexecdir
# http://www.dovecot.org/list/dovecot/2009-December/045498.html
CONFIGURE_OPTIONS+=	--libexecdir=$(ECPREFIX)/libexec

CONFIGURE_OPTIONS.32+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64+=	--sbindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS+=	--with-ldap
CONFIGURE_OPTIONS+=	--with-mysql
CONFIGURE_OPTIONS+=	--with-pgsql
CONFIGURE_OPTIONS+=	--with-sqlite
CONFIGURE_OPTIONS+=	--with-zlib

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

