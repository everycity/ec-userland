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
# Copyright 2015 Audioboo Ltd. All rights reserved.
# Copyright 2011-2013 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		sox
COMPONENT_FMRI=		audio/sox
COMPONENT_VERSION=	14.4.2
COMPONENT_LICENSE=	LGPL
COMPONENT_PROJECT_URL=	"http://sox.sourceforge.net/"
COMPONENT_SUMMARY=	Sox Audio Converter
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:81a6956d4330e75b5827316e44ae381e6f1e8928003c6aa45896da9041ea149c
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-pic
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--with-png
CONFIGURE_OPTIONS+=	--with-mad
CONFIGURE_OPTIONS+=	--with-lame

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

