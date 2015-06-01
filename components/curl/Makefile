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
#CONFIGURE_DEFAULT_CPPFLAGS = yes
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		curl
COMPONENT_FMRI=		web/curl
COMPONENT_VERSION=	7.42.1
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	http://curl.haxx.se/
COMPONENT_SUMMARY=	The C-URL Wrappers Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:e2905973391ec2dfd7743a8034ad10eeb58dab8b3a297e7892a41a7999cac887
COMPONENT_ARCHIVE_URL=	http://curl.haxx.se/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

GSSAPI_LIBDIR_32 = /usr/lib
GSSAPI_LIBDIR_64 = /usr/lib/$(MACH64)

CFLAGS += $(CPP_LARGEFILES)
CFLAGS += `pkg-config --cflags libidn`
CPPFLAGS += `pkg-config --cflags libidn`

CONFIGURE_OPTIONS += --localstatedir=$(CONFIGURE_LOCALSTATEDIR)
CONFIGURE_OPTIONS += --enable-shared --disable-static
CONFIGURE_OPTIONS += --enable-http --enable-ftp
CONFIGURE_OPTIONS += --enable-file --enable-dict
CONFIGURE_OPTIONS += --enable-manual
CONFIGURE_OPTIONS += --enable-rtsp --enable-proxy
CONFIGURE_OPTIONS += --enable-telnet --enable-tftp --enable-pop3
CONFIGURE_OPTIONS += --enable-imap --enable-smtp
CONFIGURE_OPTIONS += --enable-ipv6 --enable-nonblocking
CONFIGURE_OPTIONS += --enable-thread --enable-verbose
CONFIGURE_OPTIONS += --disable-sspi --enable-crypto-auth
CONFIGURE_OPTIONS += --enable-cookies --disable-hidden-symbols
CONFIGURE_OPTIONS += --disable-soname-bump
CONFIGURE_OPTIONS += --with-random=/dev/urandom
CONFIGURE_OPTIONS += --with-ssl
CONFIGURE_OPTIONS += --with-pic
CONFIGURE_OPTIONS += --with-libssh2

CONFIGURE_OPTIONS += --with-zlib=$(USRDIR)
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

COMPONENT_POST_INSTALL_ACTION += \
	($(MV) $(PROTOUSRDIR)/include/curl/curlbuild.h \
		$(PROTOUSRDIR)/include/curl/curlbuild-$(BITS).h )

# common targets
build:		$(BUILD_32_and_64)

install: 	$(INSTALL_32_and_64)

test: 		$(TEST_32_and_64)

BUILD_PKG_DEPENDENCIES = $(BUILD_TOOLS)

include ../../make-rules/depend.mk
