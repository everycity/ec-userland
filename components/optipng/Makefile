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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		optipng
COMPONENT_FMRI=         graphics/$(COMPONENT_NAME)
COMPONENT_VERSION=      0.7.5
COMPONENT_LICENSE=      zlib
COMPONENT_PROJECT_URL=  "http://optipng.sourceforge.net/"
COMPONENT_SUMMARY=	OptiPNG is a PNG optimizer that recompresses image files to a smaller size losslessly.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:74e54b798b012dff8993fb8d90185ca83f18cfa4935f4a93b0bcfc33c849619d
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS=	-prefix=$(ECPREFIX)
CONFIGURE_OPTIONS_64=	-bindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS_$(BITS))
CONFIGURE_OPTIONS+=	-with-system-libs

COMPONENT_PRE_CONFIGURE_ACTION=      ($(CLONEY) $(SOURCE_DIR) $(@D))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

