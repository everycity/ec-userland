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

COMPONENT_NAME=		libmad
COMPONENT_VERSION=	0.15.1b
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690
SF_PROJECT_NAME=	mad
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=	0.15.1.2

CONFIGURE_OPTIONS+=	--with-pic --disable-static --enable-shared
CONFIGURE_OPTIONS+=	--disable-debugging

COMPONENT_PRE_CONFIGURE_ACTION=cd $(SOURCE_DIR) ; touch NEWS AUTHORS ChangeLog ; autoreconf -i -s

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

