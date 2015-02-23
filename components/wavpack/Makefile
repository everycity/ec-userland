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

COMPONENT_NAME=		wavpack
COMPONENT_FMRI=		audio/wavpack
COMPONENT_VERSION=	4.70.0
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.wavpack.com/"
COMPONENT_SUMMARY=	WavPack (.WV) free open source audio codec
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:2cade379b0aba99fbc4e442ccc6dac6c609f6212e46516a083e24c8c364430a4
COMPONENT_ARCHIVE_URL=	http://www.wavpack.com/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-pic --enable-shared --disable-static
CONFIGURE_OPTIONS+=	--with-iconv=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

