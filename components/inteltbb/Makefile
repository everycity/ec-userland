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

COMPONENT_NAME=		tbb
COMPONENT_FMRI=         library/tbb
COMPONENT_VERSION=      4.3.4
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  "https://www.threadingbuildingblocks.org/"
COMPONENT_SUMMARY=	C++ template library for task parallelism
COMPONENT_SRC=		tbb43_20150316oss
COMPONENT_ARCHIVE=	tbb43_20150316oss_src.tgz
COMPONENT_ARCHIVE_HASH=	sha256:84b92a1d3bfa1f8a8c5b1dc9eaf628d8b597dc25b44a9f21b7862ecd10d8b3d4
COMPONENT_ARCHIVE_URL=	https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ENV+=		compiler=gcc
COMPONENT_BUILD_ARGS+=		tbb_build_prefix=build
COMPONENT_BUILD_TARGETS+=	default

build:		$(BUILD_64)

$(BUILD_DIR)/.installed:	$(BUILD_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include
	$(CP) -r $(SOURCE_DIR)/include/tbb $(PROTO_DIR)$(ECPREFIX)/include
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(CP) $(BUILD_DIR_64)/build/build_release/libtbb.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(CP) $(BUILD_DIR_64)/build/build_release/libtbbmalloc.so $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

