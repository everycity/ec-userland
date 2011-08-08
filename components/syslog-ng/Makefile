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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		syslog-ng
COMPONENT_VERSION=	3.2.4
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).tar.gz
#COMPONENT_ARCHIVE_HASH=	sha1:
COMPONENT_ARCHIVE_URL=	http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/$(COMPONENT_VERSION)/source/$(COMPONENT_ARCHIVE)


include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_PREFIX.32 =	$(ECPREFIX)
CONFIGURE_PREFIX.64 =	/64
CONFIGURE_PREFIX =	$(CONFIGURE_PREFIX.$(BITS))

CONFIGURE_OPTIONS += 	--sysconfdir=$(CONFIGURE_PREFIX)/etc/$(COMPONENT_NAME)
CONFIGURE_OPTIONS +=	--sbindir=$(CONFIGURE_PREFIX)/bin
CONFIGURE_OPTIONS +=	--libexecdir=$(CONFIGURE_PREFIX)/lib
CONFIGURE_OPTIONS += 	--enable-ssl
CONFIGURE_OPTIONS += 	--enable-ipv6
CONFIGURE_OPTIONS += 	--enable-sun-streams
CONFIGURE_OPTIONS += 	--enable-pcre
CONFIGURE_OPTIONS += 	--with-pic
CONFIGURE_OPTIONS += 	--with-pidfile-dir=/var/run

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

