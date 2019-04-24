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

COMPONENT_NAME=		double-conversion
COMPONENT_FMRI=         library/double-conversion
COMPONENT_VERSION=      3.1.4
COMPONENT_LICENSE=      BSD3CLAUSE
COMPONENT_PROJECT_URL=  "https://github.com/floitsch/double-conversion"
COMPONENT_SUMMARY=	Efficient binary-decimal and decimal-binary conversion routines for IEEE doubles
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	v$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:95004b65e43fefc6100f337a25da27bb99b9ef8d4071a36a33b5e83eb1f82021
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GITHUB1)
GITHUB_PROJECT=		google

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CMAKE= cmake

CMAKE_OPTIONS +=        -DCMAKE_C_COMPILER="$(CC)"
CMAKE_OPTIONS +=        -DCMAKE_CXX_COMPILER="$(CXX)"
CMAKE_OPTIONS +=        -DCMAKE_C_FLAGS="$(CFLAGS)"
CMAKE_OPTIONS +=        -DCMAKE_CXX_FLAGS="$(CXXFLAGS)"
CMAKE_OPTIONS +=	-DCMAKE_INSTALL_PREFIX=$(USRDIR)
CMAKE_OPTIONS +=	-DBUILD_SHARED_LIBS=ON

$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CMAKE) $(CMAKE_OPTIONS) $(SOURCE_DIR))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)/$(USRLIBDIR)/$(MACH64)/cmake/double-conversion
	$(INSTALL) $(BUILD_DIR_64)/generated/double-conversionConfig.cmake \
		$(PROTO_DIR)/$(USRLIBDIR)/$(MACH64)/cmake/double-conversion
	$(INSTALL) $(BUILD_DIR_64)/generated/double-conversionConfigVersion.cmake \
		$(PROTO_DIR)/$(USRLIBDIR)/$(MACH64)/cmake/double-conversion
	$(INSTALL) $(BUILD_DIR_64)/CMakeFiles/Export/lib/cmake/double-conversion/double-conversionTargets.cmake \
		$(PROTO_DIR)/$(USRLIBDIR)/$(MACH64)/cmake/double-conversion
	$(INSTALL) $(BUILD_DIR_64)/CMakeFiles/Export/lib/cmake/double-conversion/double-conversionTargets-noconfig.cmake \
		$(PROTO_DIR)/$(USRLIBDIR)/$(MACH64)/cmake/double-conversion
	$(INSTALL) $(BUILD_DIR_64)/libdouble-conversion.so.$(COMPONENT_VERSION) $(PROTO_DIR)/$(USRLIBDIR)/$(MACH64)
	( cd $(PROTO_DIR)$(USRDIR)/lib/$(MACH64) && \
                $(SYMLINK) -f libdouble-conversion.so.$(COMPONENT_VERSION) libdouble-conversion.so.3 && \
                $(SYMLINK) -f libdouble-conversion.so.3 libdouble-conversion.so )
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

#install:	$(INSTALL_32_and_64)
