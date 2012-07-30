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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libmesa
COMPONENT_VERSION=	7.11.2
COMPONENT_SRC=		Mesa-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	MesaLib-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:54f1ef35efc5431975b7487a340918712f275405
COMPONENT_ARCHIVE_URL=	ftp://ftp.freedesktop.org/pub/mesa/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk
include ../../make-rules/gnu-ld.mk

CONFIGURE_ENV+= CFLAGS="$(CC_BITS) -D _XPG4_2 -D __SunOS -D __STDC_ISO_10646__ -D __EXTENSIONS__"
CONFIGURE_ENV+= CXXFLAGS="$(CC_BITS) -D _XPG4_2 -D __SunOS -D __STDC_ISO_10646__ -D __EXTENSIONS__"

CONFIGURE_OPTIONS+=	--enable-shared 
CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS+=	--with-pic
CONFIGURE_OPTIONS+=	--with-x
CONFIGURE_OPTIONS+=	--with-driver=xlib
CONFIGURE_OPTIONS+=	--with-gallium-drivers=swrast

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

