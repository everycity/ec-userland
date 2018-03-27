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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tiff
COMPONENT_FMRI=		library/libtiff
COMPONENT_VERSION=	4.0.9
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://www.remotesensing.org/libtiff/"
COMPONENT_SUMMARY=	Tag Image File Format (TIFF) Library and Utilities
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6e7bdeec2c310734e734d19aae3a71ebe37a4d842e0e23dbb1b8921c0026cfcd
COMPONENT_ARCHIVE_URL=	http://download.osgeo.org/libtiff/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--enable-rpath
CONFIGURE_OPTIONS+=	--enable-cxx
CONFIGURE_OPTIONS+=	--without-x
CONFIGURE_OPTIONS+=	--with-docdir=$(ECPREFIX)/share/doc/tiffx

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

