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

COMPONENT_NAME=		libxext
COMPONENT_FMRI=		x11/library/libxext
COMPONENT_VERSION=	1.3.3
COMPONENT_LICENSE=	libXext
COMPONENT_PROJECT_URL=	"http://cgit.freedesktop.org/xorg/lib/libXext/"
COMPONENT_SUMMARY=	Common X Extensions library
COMPONENT_SRC=		libXext-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:eb0b88050491fef4716da4b06a4d92b4fc9e76f880d6310b2157df604342cfe5
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#LD_OPTIONS+=	-M $(PWD)/mapfile-vers

CONFIGURE_OPTIONS +=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS +=	--with-xmlto=no
CONFIGURE_OPTIONS +=	--with-sysroot=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

