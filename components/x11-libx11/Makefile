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

COMPONENT_NAME=		libX11
COMPONENT_FMRI=		x11/library/libx11
COMPONENT_VERSION=	1.6.2
COMPONENT_LICENSE=	MIT License (libX11)
COMPONENT_PROJECT_URL=	"http://xorg.freedesktop.org/releases/individual/lib/"
COMPONENT_SUMMARY=	libX11 - X11 core protocol client library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b93739bcd517723121f508bcaf0c213c1bae9c5eacffdca571ff0d86c30ead3e
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# This is so that the 64bit libgcrypt-config gets picked up
PATH.32=$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64=$(USRDIR)/bin/$(MACH64):$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH=$(PATH.$(BITS))

CONFIGURE_OPTIONS +=	--enable-shared --disable-static --with-pic --enable-xkb
CONFIGURE_OPTIONS +=	--enable-xthreads --enable-loadable-i18n --enable-xlocaledir
CONFIGURE_OPTIONS +=	--with-xcb=yes --enable-loadable-xcursor --enable-xcms
CONFIGURE_OPTIONS +=	--with-sysroot=$(USRDIR)
CONFIGURE_OPTIONS +=	--with-xmlto=no

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	cd $(PROTO_DIR)$(USRDIR)/lib && $(SYMLINK) libX11.so.6.3.0 libX11.so.4
	cd $(PROTO_DIR)$(USRDIR)/lib/$(MACH64) && $(SYMLINK) libX11.so.6.3.0 libX11.so.4
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
