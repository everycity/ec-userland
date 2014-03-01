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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gnutls
COMPONENT_FMRI=         library/security/gnutls
COMPONENT_VERSION=      3.2.11
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  http://www.gnutls.org/
COMPONENT_SUMMARY=	A secure communications library implementing the SSL, TLS and DTLS protocols
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:b844c58a72d6930abbda42129f4051dbf97f91754bea3514931173e3d01cf3c1
COMPONENT_ARCHIVE_URL=	ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk
include ../../make-rules/gnu-ld.mk

CFLAGS+=-fPIC
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--with-pic

build:		$(BUILD_32)

install:	$(INSTALL_32)

