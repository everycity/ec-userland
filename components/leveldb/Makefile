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

COMPONENT_NAME=		leveldb
COMPONENT_FMRI=		database/leveldb
COMPONENT_VERSION=	1.18
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://leveldb.org"
COMPONENT_SUMMARY=	LevelDB is a light-weight, single-purpose library for persistence with bindings to many platforms.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:4aa1a7479bc567b95a59ac6fb79eba49f61884d6fd400f20b7af147d54c5cee5
COMPONENT_ARCHIVE_URL=	https://github.com/google/leveldb/archive/v$(COMPONENT_VERSION).tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS  +=	--disable-static
#CONFIGURE_OPTIONS  +=	--enable-shared
#CONFIGURE_OPTIONS  +=	--enable-multibyte

COMPONENT_BUILD_ENV += CC="$(CC)"
COMPONENT_BUILD_ENV += CXX="$(CXX)"
COMPONENT_BUILD_ENV += CFLAGS="$(CFLAGS)"
COMPONENT_BUILD_ENV += LDFLAGS="$(LDFLAGS)"


build:		$(BUILD_32_and_64)

install: build
#	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/bin
#	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/lib
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/include/leveldb
#	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/lib/pkgconfig
#	$(MKDIR) -p $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig

	cp $(BUILD_DIR_32)/libleveldb.so* $(PROTO_DIR)$(ECPREFIX)/lib
	cp $(BUILD_DIR_64)/libleveldb.so* $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	cp $(BUILD_DIR_32)/include/leveldb/* $(PROTO_DIR)$(ECPREFIX)/include/leveldb
#	cat $(COMPONENT_DIR)/nss.pc | sed s/^Version:/Version:\ $(COMPONENT_VERSION)/ | \
#		sed s%/usr%$(ECPREFIX)% \
#		> $(PROTO_DIR)$(ECPREFIX)/lib/pkgconfig/nss.pc 
	$(TOUCH) $(BUILD_DIR_32)/.installed $(BUILD_DIR_64)/.installed
