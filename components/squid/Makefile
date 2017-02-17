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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		squid
COMPONENT_FMRI=		web/squid
COMPONENT_VERSION_MJR=	3.5
COMPONENT_VERSION_MNR=	24
COMPONENT_VERSION=	$(COMPONENT_VERSION_MJR).$(COMPONENT_VERSION_MNR)
COMPONENT_LICENSE=	squid
COMPONENT_PROJECT_URL=	"http://www.squid-cache.org/"
COMPONENT_SUMMARY=	Squid caching proxy
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:95dde57cb89adff26315c9486d0cbc59e474877de8fd9038ce01b7ddc82ede5c
COMPONENT_ARCHIVE_URL=	http://www.squid-cache.org/Versions/v3/$(COMPONENT_VERSION_MJR)/squid-$(COMPONENT_VERSION).tar.bz2

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--libdir=$(CONFIGURE_LIBDIR.$(BITS))/squid
CONFIGURE_OPTIONS+=	--libexecdir=$(CONFIGURE_LIBDIR.$(BITS))/squid
CONFIGURE_OPTIONS+=	--sysconfdir=$(CONFIGURE_SYSCONFDIR)/squid
CONFIGURE_OPTIONS+=	--datarootdir=$(ECPREFIX)/share/squid
CONFIGURE_OPTIONS+=	--disable-strict-error-checking
CONFIGURE_OPTIONS+=	--enable-auth
CONFIGURE_OPTIONS+=	--enable-cachemgr-hostname=localhost
CONFIGURE_OPTIONS+=	--enable-delay-pools
CONFIGURE_OPTIONS+=	--enable-icap-client
CONFIGURE_OPTIONS+=	--enable-icmp
CONFIGURE_OPTIONS+=	--enable-poll
CONFIGURE_OPTIONS+=	--enable-removal-policies=lru,heap
CONFIGURE_OPTIONS+=	--enable-storeio="aufs diskd rock ufs"
CONFIGURE_OPTIONS+=	--with-aio
CONFIGURE_OPTIONS+=	--with-default-user=webservd
CONFIGURE_OPTIONS+=	--disable-arch-native
CONFIGURE_OPTIONS+=	--with-openssl
CONFIGURE_OPTIONS+=	ac_cv_dbopen_libdb=yes

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
