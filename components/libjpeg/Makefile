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

# Version 9 breaks everything by redefining boolean types.
# Do not upgrade to v9.

COMPONENT_NAME=		libjpeg
COMPONENT_FMRI=		library/libjpeg
COMPONENT_VERSION=	8d
COMPONENT_LICENSE=	IJGjpeg
COMPONENT_PROJECT_URL=	"http://www.ijg.org/"
COMPONENT_SUMMARY=	Independent JPEG Group JPEG image compression library
COMPONENT_SRC=		jpeg-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	jpegsrc.v$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:00029b1473f0f0ea72fbca3230e8cb25797fbb27e58ae2e46bb8bf5a806fe0b3
COMPONENT_ARCHIVE_URL=	http://www.ijg.org/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=	0.8.4

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
# --with-sysroot=/ec

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

