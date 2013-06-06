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
# Copyright 2011-2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libpng
COMPONENT_FMRI=		library/libpng
COMPONENT_VERSION=	1.5.16
COMPONENT_LICENSE=	libpng
COMPONENT_PROJECT_URL=	http://www.libpng.org/pub/png/
COMPONENT_SUMMARY=	The official PNG reference library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0eade3b039004603a801f9556e06f604bd1e73178104c5f750ea5041694992ff
COMPONENT_ARCHIVE_URL=	http://kent.dl.sourceforge.net/project/libpng/libpng15/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic --with-sysroot=/ec

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


