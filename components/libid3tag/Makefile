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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libid3tag
COMPONENT_VERSION=	0.15.1b
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151
SF_PROJECT_NAME=	mad
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=	0.15.1.2

CONFIGURE_OPTIONS+=	--with-pic --disable-static --enable-shared
CONFIGURE_OPTIONS+=	--disable-debugging

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

