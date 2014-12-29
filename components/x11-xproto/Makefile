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

COMPONENT_NAME=		xproto
COMPONENT_FMRI=		x11/header/x11-protocols
COMPONENT_VERSION=	7.0.26
COMPONENT_LICENSE=	MIT License (xproto)
COMPONENT_PROJECT_URL=	"http://cgit.freedesktop.org/xorg/proto/x11proto/"
COMPONENT_SUMMARY=	X.org X11Proto protocol headers.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ea39fae5edf841f56525ab76590d8edbf53b8ec1a7fca0ab815917000ef02666
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_PROTO)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS +=	--enable-shared
CONFIGURE_OPTIONS +=	--disable-static
CONFIGURE_OPTIONS +=	--with-pic
#CONFIGURE_OPTIONS +=	--with-sysroot=/

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


