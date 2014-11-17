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

COMPONENT_NAME=		libxpm
COMPONENT_FMRI=		x11/library/libxpm
COMPONENT_VERSION=	3.5.11
COMPONENT_LICENSE=	MIT License (libxpm)
COMPONENT_PROJECT_URL=	"http://cgit.freedesktop.org/xorg/lib/libXpm"
COMPONENT_SUMMARY=	XPM format pixmap library
COMPONENT_SRC=		libXpm-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:53ddf924441b7ed2de994d4934358c13d9abf4828b1b16e1255ade5032b31df7
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--with-sysroot=/ec 'LIBS=-lintl'

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

