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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gnutls
COMPONENT_FMRI=         library/security/gnutls
COMPONENT_VERSION=      3.3.13
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  http://www.gnutls.org/
COMPONENT_SUMMARY=	A secure communications library implementing the SSL, TLS and DTLS protocols
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:91bf1ef5c159b7f2176f972184545b287af6507ab55a543f6007d31406b97a99
COMPONENT_ARCHIVE_URL=	ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS += -lsocket -lnsl

CFLAGS+=	$(CC_PIC)
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--with-pic
CONFIGURE_OPTIONS+=	--disable-hardware-acceleration

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

