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

COMPONENT_NAME=		libXi
COMPONENT_FMRI=		x11/library/xi
COMPONENT_VERSION=	1.7.4
COMPONENT_LICENSE=	OpenGroup
COMPONENT_PROJECT_URL=	"http://cgit.freedesktop.org/xorg/lib/libXi"
COMPONENT_SUMMARY=	X.org libXi Client library for XInput.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ddf7c56bc0d7206308c22365f694c1a1f177eb3b801fc22d42ead378440aca54
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static

build:		$(BUILD_32_and_64)

#$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
#	cd $(PROTO_DIR)$(ECPREFIX)/lib && $(SYMLINK) libXi.so.6.1.0 libXi.so.5
#	cd $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64) && $(SYMLINK) libXi.so.6.1.0 libXi.so.5
#	$(TOUCH) $@

#install:	$(BUILD_DIR)/.installed
install:	$(INSTALL_32_and_64)
