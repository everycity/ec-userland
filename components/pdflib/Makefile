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

COMPONENT_NAME=		PDFlib-Lite
COMPONENT_VERSION=	7.0.5p3
IPS_COMPONENT_VERSION=	7.0.5.3
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e5fb30678165d28b2bf066f78d5f5787e73a2a28d4902b63e3e07ce1678616c9
COMPONENT_ARCHIVE_URL=	http://www.pdflib.com/binaries/PDFlib/705/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=     LDFLAGS="$(LDFLAGS)"
CONFIGURE_OPTIONS+=     --disable-static
CONFIGURE_OPTIONS+=     --with-pic
CONFIGURE_OPTIONS+=     --without-java
CONFIGURE_OPTIONS+=     --without-perl
CONFIGURE_OPTIONS+=     --without-py
CONFIGURE_OPTIONS+=     --without-ruby
CONFIGURE_OPTIONS+=     --without-tcl

COMPONENT_BUILD_ARGS += -j16
#COMPONENT_PREP_ACTION+= ( cd $(SOURCE_DIR) ; libtoolize --force --copy ; autoreconf )
COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

#build:		$(BUILD_64)
#install:	$(INSTALL_64)
build:		$(BUILD_32_and_64)
install:	$(INSTALL_32_and_64)
