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

COMPONENT_NAME=		rtmpdump
COMPONENT_FMRI=		multimedia/rtmpdump
COMPONENT_VERSION=	2.3
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://rtmpdump.mplayerhq.hu/"
COMPONENT_SUMMARY=	rtmpdump is a toolkit for RTMP streams
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha256:ef38b7a99d82ce6912063d21063aeaf28185341b3df486e24bffce5354224b2c
COMPONENT_ARCHIVE_URL=	http://$(COMPONENT_NAME).mplayerhq.hu/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ENV+=	LDFLAGS="$(LDFLAGS)"
COMPONENT_BUILD_ARGS+=	XCFLAGS="$(LD_BITS)" XLDFLAGS="$(LD_BITS)"

$(BUILD_DIR)/.pkgconfig_built:
	(cd $(BUILD_DIR_32)/librtmp ; make librtmp.pc)
	(cd $(BUILD_DIR_64)/librtmp ; make librtmp.pc)
	$(TOUCH) $@

build:		$(BUILD_32_and_64) $(BUILD_DIR)/.pkgconfig_built

$(BUILD_DIR)/.installed:	$(BUILD_32_and_64) $(BUILD_DIR)/.pkgconfig_built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/include/librtmp
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/pkgconfig
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/man1
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/man3
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/man8
	$(INSTALL) $(BUILD_DIR_32)/librtmp/librtmp.3 $(PROTO_DIR)$(ECPREFIX)/share/man3/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/librtmp.pc $(PROTO_DIR)$(ECPREFIX)/lib/pkgconfig/
	$(INSTALL) $(BUILD_DIR_32)/rtmpdump $(PROTO_DIR)$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_32)/rtmpgw $(PROTO_DIR)$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_32)/rtmpsrv $(PROTO_DIR)$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_32)/rtmpsuck $(PROTO_DIR)$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_32)/rtmpdump.1 $(PROTO_DIR)$(ECPREFIX)/share/man1/
	$(INSTALL) $(BUILD_DIR_32)/rtmpgw.8 $(PROTO_DIR)$(ECPREFIX)/share/man8/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/amf.h $(PROTO_DIR)$(ECPREFIX)/include/librtmp/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/http.h $(PROTO_DIR)$(ECPREFIX)/include/librtmp/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/log.h $(PROTO_DIR)$(ECPREFIX)/include/librtmp/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/rtmp.h $(PROTO_DIR)$(ECPREFIX)/include/librtmp/
	$(INSTALL) $(BUILD_DIR_32)/librtmp/librtmp.so.0 $(PROTO_DIR)$(ECPREFIX)/lib/
	(cd $(PROTO_DIR)$(ECPREFIX)/lib ; ln -sf librtmp.so.0 librtmp.so)
	$(INSTALL) $(BUILD_DIR_64)/librtmp/librtmp.pc $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/pkgconfig/
	$(INSTALL) $(BUILD_DIR_64)/rtmpdump $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/rtmpgw $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/rtmpsrv $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/rtmpsuck $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_64)/librtmp/librtmp.so.0 $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)
	(cd $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64) ; ln -sf librtmp.so.0 librtmp.so)
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
