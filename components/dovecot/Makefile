#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2011 EveryCity Ltd.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		dovecot
COMPONENT_VERSION=	2.0.16
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:0df6e84233339ee308deaecd8f1a7ffddcaeca16
COMPONENT_ARCHIVE_URL=	http://www.dovecot.org/releases/2.0/$(COMPONENT_ARCHIVE)

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

