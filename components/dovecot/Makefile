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
# Copyright 2011,2012 EveryCity Ltd.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		dovecot
COMPONENT_VERSION=	2.1.10
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8acc99c2a7e8b598aef2fef443c5fb6779099e57573f86a1eaa2b8479d0becb9
COMPONENT_ARCHIVE_URL=	http://www.dovecot.org/releases/2.1/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# Encode runpaths for MySQL and Postgresql
LDFLAGS.32+=    -L$(ECPREFIX)/lib/mysql/5.5/lib -R$(ECPREFIX)/lib/mysql/5.5/lib
LDFLAGS.32+=    -L$(ECPREFIX)/lib/postgres/9.1/lib -R$(ECPREFIX)/lib/postgres/9.1/lib

# Dovecot doesn't seem to want to support libdir==libexecdir
# http://www.dovecot.org/list/dovecot/2009-December/045498.html
CONFIGURE_OPTIONS+=	--libexecdir=$(ECPREFIX)/libexec

CONFIGURE_OPTIONS.32+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64+=	--sbindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS+=	--with-mysql
CONFIGURE_OPTIONS+=	--with-pgsql

build:		$(BUILD_32)

install:	$(INSTALL_32)

