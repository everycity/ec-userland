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

COMPONENT_NAME=		libcdr
COMPONENT_FMRI=         library/libcdr
COMPONENT_VERSION=      0.1.1
COMPONENT_LICENSE=      MPLv2.0
COMPONENT_PROJECT_URL=  "http://www.freedesktop.org/wiki/Software/libcdr/"
COMPONENT_SUMMARY=	Libcdr provides the ability to interpret and import Corel Draw drawings into various applications
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ea3c28c76afa79cd18f749c8b760ba28ba18260de614cdb8810006eca781d460
COMPONENT_ARCHIVE_URL=	http://dev-www.libreoffice.org/src/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--disable-werror

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

