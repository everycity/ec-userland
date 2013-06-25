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
# Copyright 2012-2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

# Note: curlbuild.h comes in two flavours, 32bit and 64bit
# These have been combined with a "#if (defined(__x86_64__))"
# statement and is present in the build directory here.
# If updating curl, you will need to re-combine these from the
# build directory as curlbuild.h is generated during compile
# time.

COMPONENT_NAME=		curl
COMPONENT_FMRI=		web/curl
COMPONENT_VERSION=	7.31.0
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	http://curl.haxx.se/
COMPONENT_SUMMARY=	The C-URL Wrappers Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:a73b118eececff5de25111f35d1d0aafe1e71afdbb83082a8e44d847267e3e08
COMPONENT_ARCHIVE_URL=	http://curl.haxx.se/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS+=	-I$(ECPREFIX)/include

CFLAGS=	$(CC_BITS) -O3

CONFIGURE_ENV+=	CPPFLAGS="$(CPPFLAGS)"

CONFIGURE_OPTIONS+=	--with-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--with-libidn=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-ca-bundle=$(CONFIGURE_SYSCONFDIR)/openssl/cabundle.pem
CONFIGURE_OPTIONS+=	--without-librtmp
CONFIGURE_OPTIONS+=	--disable-ldap
CONFIGURE_OPTIONS+=	--disable-ldaps

COMPONENT_POST_INSTALL_ACTION.32 =	( perl -pi -e \
	's/CURLLIBDIR=.*/CURLLIBDIR="-L\/ec\/lib -R\/ec\/lib "/' \
	$(PROTO_DIR)$(ECPREFIX)/bin/curl-config )
COMPONENT_POST_INSTALL_ACTION.64 =	( perl -pi -e \
	's/CURLLIBDIR=.*/CURLLIBDIR="-L\/ec\/lib\/$(MACH64) -R\/ec\/lib\/$(MACH64) "/' \
	$(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/curl-config )
COMPONENT_POST_INSTALL_ACTION=$(COMPONENT_POST_INSTALL_ACTION.$(BITS))

# common targets
build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

