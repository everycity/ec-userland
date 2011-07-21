#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		rtmpdump
COMPONENT_VERSION=	2.3
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha1:b65ce7708ae79adb51d1f43dd0b6d987076d7c42
COMPONENT_ARCHIVE_URL=	http://$(COMPONENT_NAME).mplayerhq.hu/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk
include ../../make-rules/gnu-ld.mk

M64FLAG.32=
M64FLAG.64=-m64

COMPONENT_BUILD_ENV+=	LDFLAGS=-m64
COMPONENT_BUILD_ARGS+=	XCFLAGS="$(M64FLAG.$(BITS))" XLDFLAGS="$(M64FLAG.$(BITS))" XLIBS="$(M64FLAG.$(BITS))"

build:		$(BUILD_32_and_64)

build-pkgconfig:
	(cd $(BUILD_DIR_32)/librtmp ; make librtmp.pc)
	(cd $(BUILD_DIR_64)/librtmp ; make librtmp.pc)

install:	build build-pkgconfig
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/include/librtmp
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/lib/pkgconfig
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/share/man1
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/share/man3
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/share/man8
	$(INSTALL) $(BUILD_DIR_32)/librtmp/librtmp.3 $(PROTO_DIR)/$(ECPREFIX)/share/man3/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/librtmp.pc $(PROTO_DIR)/$(ECPREFIX)/lib/pkgconfig/
	$(INSTALL) $(BUILD_DIR_32)/rtmpdump $(PROTO_DIR)/$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_32)/rtmpgw $(PROTO_DIR)/$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_32)/rtmpsrv $(PROTO_DIR)/$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_32)/rtmpsuck $(PROTO_DIR)/$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_32)/rtmpdump.1 $(PROTO_DIR)/$(ECPREFIX)/share/man1/
	$(INSTALL) $(BUILD_DIR_32)/rtmpgw.8 $(PROTO_DIR)/$(ECPREFIX)/share/man8/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/amf.h $(PROTO_DIR)/$(ECPREFIX)/include/librtmp/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/http.h $(PROTO_DIR)/$(ECPREFIX)/include/librtmp/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/log.h $(PROTO_DIR)/$(ECPREFIX)/include/librtmp/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/rtmp.h $(PROTO_DIR)/$(ECPREFIX)/include/librtmp/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/librtmp.so.0 $(PROTO_DIR)/$(ECPREFIX)/lib/
	(cd $(PROTO_DIR)/$(ECPREFIX)/lib ; ln -sf librtmp.so.0 librtmp.so)
	$(INSTALL) $(BUILD_DIR_64)/librtmp/librtmp.pc $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)/pkgconfig/
	$(INSTALL) $(BUILD_DIR_64)/rtmpdump $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/rtmpgw $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/rtmpsrv $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/rtmpsuck $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/librtmp/librtmp.so.0 $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)
	(cd $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64) ; ln -sf librtmp.so.0 librtmp.so)

