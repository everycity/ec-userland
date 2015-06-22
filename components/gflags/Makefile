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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gflags
COMPONENT_FMRI=         library/gflags
COMPONENT_VERSION=      2.1.2
COMPONENT_LICENSE=      BSD3CLAUSE
COMPONENT_PROJECT_URL=  "https://gflags.github.io/gflags/"
COMPONENT_SUMMARY=	C++ library that implements commandline flags processing
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d8331bd0f7367c8afd5fcb5f5e85e96868a00fd24b7276fa5fcee1e5575c2662
COMPONENT_ARCHIVE_URL=	https://github.com/gflags/gflags/archive/v2.1.2.tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_LICENSE_FILE=	COPYING.txt

CMAKE= cmake

CMAKE_OPTIONS+= -DCMAKE_RELEASE_TYPE=Release
CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=$(USRDIR)
CMAKE_OPTIONS+= -DBUILD_SHARED_LIBS=ON
CMAKE_OPTIONS+= -DINSTALL_BINDIR=$(CONFIGURE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_LIBDIR=$(CONFIGURE_LIBDIR.$(BITS))

$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CMAKE) $(CMAKE_OPTIONS) $(SOURCE_DIR))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

