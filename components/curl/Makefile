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
CONFIGURE_DEFAULT_CPPFLAGS = yes

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		curl
COMPONENT_FMRI=		web/curl
COMPONENT_VERSION=	7.37.0
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	http://curl.haxx.se/
COMPONENT_SUMMARY=	The C-URL Wrappers Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:24502492de3168b0556d8e1a06f14f7589e57b204917d602a572e14239b3e09e
COMPONENT_ARCHIVE_URL=	http://curl.haxx.se/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

GSSAPI_LIBDIR_32 = /usr/lib
GSSAPI_LIBDIR_64 = /usr/lib/$(MACH64)

CFLAGS += $(CPP_LARGEFILES)
CFLAGS += `pkg-config --cflags libidn`
CPPFLAGS += `pkg-config --cflags libidn`

CPPFLAGS+= -I$(USRDIR)/include

CONFIGURE_OPTIONS += --with-pic
CONFIGURE_OPTIONS += --enable-shared
CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --with-libidn=$(USRDIR)
CONFIGURE_OPTIONS += --with-ca-bundle=$(CONFIGURE_SYSCONFDIR)/openssl/cabundle.pem
CONFIGURE_OPTIONS += --without-librtmp
CONFIGURE_OPTIONS += --disable-ldap
CONFIGURE_OPTIONS += --disable-ldaps

CONFIGURE_OPTIONS += --with-gssapi-includes=$(USRDIR)/include/gssapi
CONFIGURE_OPTIONS += --with-gssapi-libs=$(GSSAPI_LIBDIR_$(BITS))
CONFIGURE_OPTIONS += --with-gssapi=$(USRDIR)
CONFIGURE_OPTIONS += "curl_disallow_getifaddrs=yes"

#COMPONENT_POST_INSTALL_ACTION.32 =	( perl -pi -e \
#	's/CURLLIBDIR=.*/CURLLIBDIR="-L$(USRDIR)\/lib -R$(USRDIR)\/lib "/' \
#	$(PROTO_DIR)$(USRDIR)/bin/curl-config )
#COMPONENT_POST_INSTALL_ACTION.64 =	( perl -pi -e \
#	's/CURLLIBDIR=.*/CURLLIBDIR="-L$(USRDIR)\/lib\/$(MACH64) -R$(USRDIR)\/lib\/$(MACH64) "/' \
#	$(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/curl-config )
#COMPONENT_POST_INSTALL_ACTION=$(COMPONENT_POST_INSTALL_ACTION.$(BITS))

# common targets
build:		$(BUILD_32_and_64)

install: 	$(INSTALL_32_and_64)

test: 		$(TEST_32_and_64)

BUILD_PKG_DEPENDENCIES = $(BUILD_TOOLS)

include ../../make-rules/depend.mk
