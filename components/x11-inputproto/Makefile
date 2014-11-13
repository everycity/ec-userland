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

COMPONENT_NAME=		inputproto
COMPONENT_FMRI=		x11/header/input-protocols
COMPONENT_VERSION=	2.3.1
COMPONENT_LICENSE=	MIT License (inputproto)
COMPONENT_PROJECT_URL=	"http://cgit.freedesktop.org/xorg/proto/inputproto/"
COMPONENT_SUMMARY=	X.org InputProto protocol headers.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:23f65ac55c36ea8c378e30b4a4fd85317c95923134e3fe46569741b94c8ed4ca
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_PROTO)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

