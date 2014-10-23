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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		powerdns-recursor
COMPONENT_FMRI=         network/powerdns/recursor
COMPONENT_VERSION=	3.6.1
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  https://www.powerdns.com/recursor.html
COMPONENT_SUMMARY=	PowerDNS high performance recursive DNS server
COMPONENT_SRC=		pdns-recursor-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:e57bad320d67d08604fc6f6b7e49b5553cfb5baf3460a3e06d53ba2f7d8de396
COMPONENT_ARCHIVE_URL=	http://downloads.powerdns.com/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-lnsl -lsocket -lresolv
COMPONENT_BUILD_ENV+=	LDFLAGS="$(LDFLAGS)"

CONFIGURE_LIBDIR.32 =   $(CONFIGURE_PREFIX)/lib/powerdns
CONFIGURE_LIBDIR.64 =   $(CONFIGURE_PREFIX)/lib/powerdns/$(MACH64)
CONFIGURE_SYSCONFDIR=	$(ECPREFIX)/etc/powerdns

CONFIGURE_OPTIONS += --with-pic
CONFIGURE_OPTIONS += --enable-shared
CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --with-boost=$(ECPREFIX)

COMPONENT_PRE_CONFIGURE_ACTION+= $(CLONEY) $(SOURCE_DIR) $(@D)

COMPONENT_BUILD_ENV+= CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" CXXFLAGS="$(CFLAGS)"

COMPONENT_INSTALL_ARGS+=	SBINDIR="$(CONFIGURE_BINDIR.$(BITS))" BINDIR="$(CONFIGURE_BINDIR.$(BITS))" SYSCONFDIR="$(ECPREFIX)/etc/powerdns/" LOCALSTATEDIR="$(ECPREFIX)/var/run/" SHAREDIR="$(ECPREFIX)/share"

PKG_PROTO_DIRS+=	$(PROTO_DIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

