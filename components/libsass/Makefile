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

COMPONENT_NAME=		libsass
COMPONENT_FMRI=         library/libsass
COMPONENT_VERSION=      3.4.6
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://sass-lang.com/libsass"
COMPONENT_SUMMARY=	A C/C++ implementation of a Sass compiler
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:686bc09cc31bba32915f42a6da5e7d221c07690d4d597e2748cdd02abd3d7c2c
COMPONENT_ARCHIVE_URL=	https://github.com/sass/libsass/archive/$(COMPONENT_VERSION).tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) ; autoreconf -i -f )
#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

