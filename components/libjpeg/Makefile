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

COMPONENT_NAME=		libjpeg
COMPONENT_FMRI=		library/libjpeg
COMPONENT_VERSION=	9
COMPONENT_LICENSE=	IJGjpeg
COMPONENT_PROJECT_URL=	"http://www.ijg.org/"
COMPONENT_SUMMARY=	Independent JPEG Group JPEG image compression library
COMPONENT_SRC=		jpeg-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	jpegsrc.v$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c4e29e9375aaf60b4b79db87a58b063fb5b84f923bee97a88280b3d159e7e535
COMPONENT_ARCHIVE_URL=	http://www.ijg.org/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=	0.9

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic --with-sysroot=/ec

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

