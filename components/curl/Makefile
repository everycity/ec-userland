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

COMPONENT_NAME=		curl
COMPONENT_FMRI=		web/curl
COMPONENT_VERSION=	7.38.0
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	http://curl.haxx.se/
COMPONENT_SUMMARY=	The C-URL Wrappers Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:035bd41e99aa1a4e64713f4cea5ccdf366ca8199e9be1b53d5a043d5165f9eba
COMPONENT_ARCHIVE_URL=	http://curl.haxx.se/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS+=	-I$(ECPREFIX)/include

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

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	# Note: curl generates a header file, include/curl/curlbuild.h, during the build
	# This header file is different depending on 32bit or 64bit build
	/usr/bin/echo "/* EC: combining 32 and 64bit headers */\n\n#if (defined (__x86_64__))\n" > $(COMPONENT_DIR)/curlbuild.h
	/usr/bin/cat $(BUILD_DIR_64)/include/curl/curlbuild.h >> $(COMPONENT_DIR)/curlbuild.h
	/usr/bin/echo "\n#else /* EC: following is 32bit */\n" >> $(COMPONENT_DIR)/curlbuild.h
	/usr/bin/cat $(BUILD_DIR_32)/include/curl/curlbuild.h >> $(COMPONENT_DIR)/curlbuild.h
	/usr/bin/echo "\n#endif /* EC */" >> $(COMPONENT_DIR)/curlbuild.h
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
