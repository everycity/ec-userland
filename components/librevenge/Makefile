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

COMPONENT_NAME=		librevenge
COMPONENT_FMRI=         library/librevenge
COMPONENT_VERSION=      0.0.1
COMPONENT_LICENSE=      LGPLv2/MPLv2.0
COMPONENT_PROJECT_URL=  "http://sourceforge.net/p/libwpd/wiki/librevenge/"
COMPONENT_SUMMARY=	librevenge is a base library for writing document import filters.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:cbbebf09a2c5ecc42611bb77a87f4aa832a1b30e327e6c3bd15b418062c8c99f
SF_PROJECT_NAME=	libwpd
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared	--with-pic

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

