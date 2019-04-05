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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gflags
COMPONENT_FMRI=         library/gflags
COMPONENT_VERSION=      2.2.2
COMPONENT_LICENSE=      BSD3CLAUSE
COMPONENT_LICENSE_FILE=	COPYING.txt
COMPONENT_PROJECT_URL=  "https://gflags.github.io/gflags/"
COMPONENT_SUMMARY=	C++ library that implements commandline flags processing
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	v$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GITHUB1)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CMAKE= cmake

CMAKE_LIBDIR.32 =       lib
CMAKE_LIBDIR.64 =       lib/$(MACH64)

CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=$(USRDIR)
CMAKE_OPTIONS+=	-DGFLAGS_LIBRARY_INSTALL_DIR=$(CMAKE_LIBDIR.$(BITS))
CMAKE_OPTIONS+= -DBUILD_SHARED_LIBS=ON

$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CMAKE) $(CMAKE_OPTIONS) $(SOURCE_DIR))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
