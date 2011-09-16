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

COMPONENT_NAME=		ghostscript
COMPONENT_VERSION=	9.04
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:75370060d0a272e66be20152a058e4135976f2e5
COMPONENT_ARCHIVE_URL=	http://downloads.ghostscript.com/public/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=9.4

# make build isn't thread safe.
COMPONENT_BUILD_GMAKE_ARGS=

CONFIGURE_OPTIONS += 	--with-drivers=ALL
CONFIGURE_OPTIONS +=	--enable-dynamic
CONFIGURE_OPTIONS +=	--with-ijs
CONFIGURE_OPTIONS +=	--without-omni
CONFIGURE_OPTIONS +=	--with-jbig2dec
CONFIGURE_OPTIONS +=	--with-jasper
CONFIGURE_OPTIONS +=	--disable-compile-inits
CONFIGURE_OPTIONS +=	--with-fontpath=$(ECPREFIX)/share/$(COMPONENT_NAME)/$(COMPONENT_VERSION)/Resource:$(ECPREFIX)/share/$(COMPONENT_NAME)/$(COMPONENT_VERSION)/Resource/Font:$(ECPREFIX)/share/$(COMPONENT_NAME)/fonts:/usr/openwin/lib/X11/fonts/Type1:/usr/openwin/lib/X11/fonts/TrueType:/usr/openwin/lib/X11/fonts/Type3:/usr/X11/lib/X11/fonts/Type1:/usr/X11/lib/fonts/TrueType:/usr/X11/lib/X11/fonts/Type3:/usr/X11/lib/X11/fonts/Resource:/usr/X11/lib/X11/Resource/Font


COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

