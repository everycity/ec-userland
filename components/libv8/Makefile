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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libv8
COMPONENT_FMRI=         library/v8
COMPONENT_VERSION=      3.16.14
COMPONENT_MJR_VERSION=	3
COMPONENT_LICENSE=      modified-bsd
COMPONENT_PROJECT_URL=  http://code.google.com/p/v8
COMPONENT_SUMMARY=	V8 JavaScript Engine
COMPONENT_SRC=		v8-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:56c70578d59f278b767457113df81c424b88fef367c938b4ae7c25c68ec26777
COMPONENT_ARCHIVE_URL=	https://github.com/v8/v8/archive/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION=	(cd $(@D); $(GMAKE) dependencies;)
COMPONENT_BUILD_ENV+=		LDFLAGS="$(LDFLAGS) -lnsl"
COMPONENT_BUILD_ARGS=		console=readline library=shared soname_version=$(COMPONENT_VERSION)
COMPONENT_BUILD_TARGETS=	ia32.release

build:		$(BUILD_32)

$(BUILD_DIR)/.installed:	$(BUILD_DIR_32)/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin
	$(CP) $(BUILD_DIR_32)/out/ia32.release/d8 $(PROTO_DIR)$(ECPREFIX)/bin
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include
	$(CP) $(BUILD_DIR_32)/include/v8-debug.h $(PROTO_DIR)$(ECPREFIX)/include
	$(CP) $(BUILD_DIR_32)/include/v8-preparser.h $(PROTO_DIR)$(ECPREFIX)/include
	$(CP) $(BUILD_DIR_32)/include/v8-profiler.h $(PROTO_DIR)$(ECPREFIX)/include
	$(CP) $(BUILD_DIR_32)/include/v8-testing.h $(PROTO_DIR)$(ECPREFIX)/include
	$(CP) $(BUILD_DIR_32)/include/v8.h $(PROTO_DIR)$(ECPREFIX)/include
	$(CP) $(BUILD_DIR_32)/include/v8stdint.h $(PROTO_DIR)$(ECPREFIX)/include
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib
	$(CP) $(BUILD_DIR_32)/out/ia32.release/lib.target/libv8.so.$(COMPONENT_VERSION) $(PROTO_DIR)$(ECPREFIX)/lib
	( cd $(PROTO_DIR)$(ECPREFIX)/lib ; \
		$(SYMLINK) libv8.so.$(COMPONENT_VERSION) libv8.so ; \
		$(SYMLINK) libv8.so.$(COMPONENT_VERSION) libv8.so.$(COMPONENT_MJR_VERSION) ; )
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

