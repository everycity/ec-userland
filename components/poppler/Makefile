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

COMPONENT_NAME=		poppler
COMPONENT_FMRI=         library/poppler
COMPONENT_VERSION=      0.24.5
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  "http://poppler.freedesktop.org/"
COMPONENT_SUMMARY=	Poppler PDF rendering library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:a2654910100c923c44e366242495e226db2798254f2fa2781138867348759f84
COMPONENT_ARCHIVE_URL=	http://poppler.freedesktop.org/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-libcurl
CONFIGURE_OPTIONS+=	--enable-zlib

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

