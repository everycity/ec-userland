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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libxaw
COMPONENT_VERSION=	1.0.11
COMPONENT_SRC=		libXaw-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ef4dd840b2896401c75d68cf0296a7243b5953f22261f8e8c4a92b53e771fc90
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--with-sysroot=/ec 'LIBS=-lintl'

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

