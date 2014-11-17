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

COMPONENT_NAME=		libXrender
COMPONENT_FMRI=		x11/library/libxrender
COMPONENT_VERSION=	0.9.8
COMPONENT_LICENSE=	x11-libxrender
COMPONENT_PROJECT_URL=	"http://cgit.freedesktop.org/xorg/lib/libXrender/"
COMPONENT_SUMMARY=	The X Rendering Extension introduces digital image composition as the foundation of a rendering model within the X Window System
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c3acffff4cd5c91585e8c4fdf1ec29fc234482f661ed548112b4d52db19963d1
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LD_OPTIONS+=	-M $(PWD)/mapfile-vers

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--with-sysroot=/ec 'LIBS=-lintl'

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

