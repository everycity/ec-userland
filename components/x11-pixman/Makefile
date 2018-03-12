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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pixman
COMPONENT_FMRI=		x11/library/pixman
COMPONENT_VERSION=	0.34.0
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://xorg.freedesktop.org/releases/individual/lib/"
COMPONENT_SUMMARY=	Pixman: The pixel-manipulation library for X and Cairo.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:21b6b249b51c6800dc9553b65106e1e37d0e25df942c90531d4c3997aa20a88e
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic --with-sysroot=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

