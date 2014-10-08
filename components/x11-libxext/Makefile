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
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libxext
COMPONENT_VERSION=	1.3.0
COMPONENT_SRC=		libXext-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:908be0c2374d584be0bcc36cb0e5e324714d28f2
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS +=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS +=	--with-xmlto=no
CONFIGURE_OPTIONS +=	--with-sysroot=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

