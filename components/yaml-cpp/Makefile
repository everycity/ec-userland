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

COMPONENT_NAME=		yaml-cpp
COMPONENT_FMRI=         library/yaml-cpp
COMPONENT_VERSION=      0.5.2
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "https://github.com/jbeder/yaml-cpp"
COMPONENT_SUMMARY=	A YAML parser and emitter in C++
COMPONENT_SRC=		yaml-cpp-release-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	release-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6fb92f6f5925e0af918ffbb90acf19b7b88706ebcd40fc186b7caa76609b6350
COMPONENT_ARCHIVE_URL=	https://github.com/jbeder/yaml-cpp/archive/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_LICENSE_FILE=	license.txt

LDFLAGS+=	-lstdc++

CMAKE_OPTIONS+= -DCMAKE_RELEASE_TYPE=Release
CMAKE_OPTIONS+= -DCMAKE_INSTALL_PREFIX=$(ECPREFIX)
CMAKE_OPTIONS+= -DBUILD_SHARED_LIBS=ON
CMAKE_OPTIONS+= -DINSTALL_BINDIR=$(CONFIGURE_BINDIR.$(BITS))
CMAKE_OPTIONS+= -DINSTALL_LIBDIR=$(CONFIGURE_LIBDIR.$(BITS))

CMAKE= cmake

$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CMAKE) $(CMAKE_OPTIONS) $(SOURCE_DIR))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32) $(BUILD_32_and_64)
	$(INSTALL) -D $(BUILD_DIR_64)/libyaml-cpp.so.0.5.2 $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/libyaml-cpp.so.0.5.2
	(cd $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64); \
	$(SYMLINK) libyaml-cpp.so.0.5.2 libyaml-cpp.so.0.5; \
	$(SYMLINK) libyaml-cpp.so.0.5.2 libyaml-cpp.so; )
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(GSED) 's!${prefix}/lib!${prefix}/lib/$(MACH64)!' build/amd64/yaml-cpp.pc > $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig/yaml-cpp.pc
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
