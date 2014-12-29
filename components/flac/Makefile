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

COMPONENT_NAME=		flac
COMPONENT_FMRI=		audio/flac
COMPONENT_VERSION=	1.3.1
COMPONENT_LICENSE=	BSD,GPL
COMPONENT_PROJECT_URL=	"https://xiph.org/flac/"
COMPONENT_SUMMARY=	Free Lossless Audio Codec
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:4773c0099dba767d963fd92143263be338c48702172e8754b9bc5103efe1c56c
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XIPH)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS.64	+= --with-ogg-libraries=$(ECPREFIX)/lib/$(MACH64)

CONFIGURE_OPTIONS+=	--with-pic --enable-shared --disable-static
CONFIGURE_OPTIONS+=	--with-ogg=/ec
CONFIGURE_OPTIONS+=	--enable-sse

COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -r $(SOURCE_DIR)/* $(@D)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

