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
# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		net-snmp
COMPONENT_VERSION=	5.4.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:ac5ba033c10d53d3057415121f8c4936c643c208
COMPONENT_ARCHIVE_URL=	http://ftp.ntua.gr/mirror/net-snmp/OldFiles/net-snmp-5.4.x/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS += "-DFALSE_SHARING_ALIGN=64"

CONFIGURE_OPTIONS  +=	--with-default-snmp-version=3
CONFIGURE_OPTIONS  +=	--with-sys-contact="root@localhost"
CONFIGURE_OPTIONS  +=	--with-sys-location=Unknown
CONFIGURE_OPTIONS  +=	--with-logfile=$(CONFIGURE_LOCALSTATEDIR)/log/net-snmp/snmpd.log
CONFIGURE_OPTIONS  +=	--with-persistent-directory=$(CONFIGURE_LOCALSTATEDIR)/net-snmp

CONFIGURE_OPTIONS  +=	--with-mibdirs=$(CONFIGURE_SYSCONFDIR)/net-snmp/snmp/mibs
CONFIGURE_OPTIONS  +=	--datadir=$(CONFIGURE_SYSCONFDIR)/net-snmp
CONFIGURE_OPTIONS  +=	--enable-agentx-dom-sock-only
CONFIGURE_OPTIONS  +=	--enable-ucd-snmp-compatibility
CONFIGURE_OPTIONS  +=	--enable-ipv6
CONFIGURE_OPTIONS  +=	--enable-mfd-rewrites
CONFIGURE_OPTIONS  +=	--with-pkcs
CONFIGURE_OPTIONS  +=	--with-transports="UDP TCP UDPIPv6 TCPIPv6"

# Which MIB modules do we want to build
MIB_MOBULES.sparc = ucd-snmp/lmSensors
MIB_MODULES = host disman/event-mib ucd-snmp/diskio udp-mib tcp-mib if-mib
MIB_MOBULES += $(MIB_MODULES.$(MACH))
CONFIGURE_OPTIONS  +=	--with-mib-modules="$(MIB_MODULES)"

# Only build 32 bit Perl support
#PERL_ARGS =			DESTDIR=$(PROTO_DIR) INSTALLDIRS=vendor
#CONFIGURE_OPTIONS.32  +=	PERLPROG="$(PERL)"
#CONFIGURE_OPTIONS.32  +=	--with-perl-modules="$(PERL_ARGS)"
#CONFIGURE_OPTIONS.32  +=	--disable-perl-cc-checks

#CONFIGURE_OPTIONS.64  +=	--disable-embedded-perl
#CONFIGURE_OPTIONS.64  +=	--without-perl-modules

CONFIGURE_OPTIONS+=	--without-perl-modules

#CONFIGURE_OPTIONS	+=	CFLAGS="$(CFLAGS)"
#CONFIGURE_OPTIONS	+=	CPPFLAGS="$(CPPFLAGS)"
#CONFIGURE_OPTIONS	+=	CC="$(CC)"

#PKG_MACROS +=	BUILD_DIR=$(BUILD_DIR)

$(INSTALL_64): COMPONENT_INSTALL_ARGS += DESTDIR=$(BUILD_DIR)/prototype/$(MACH64)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

