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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		live555
COMPONENT_VERSION=	2012.07.03
COMPONENT_SRC=		live
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:019d2b39b724d630ae466c614d31f16b69c4d2780ec427be663637394d29d699
COMPONENT_ARCHIVE_URL=	http://www.live555.com/liveMedia/public/$(COMPONENT_ARCHIVE)

IPS_COMPONENT_VERSION=	2012.7.3

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION+=	( $(CP) -R $(SOURCE_DIR)/* $(@D)/ ; cd $(@D) ; ./genMakefiles solaris-$(BITS)bit )

CLEAN_PATHS+=	install

build:		$(BUILD_32_and_64)

# This recipe taken from http://ftp.de.debian.org/debian/pool/main/libl/liblivemedia/
install:	build
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/bin
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/lib
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)
	for f in BasicUsageEnvironment \
		UsageEnvironment liveMedia groupsock; do \
	  $(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/include/$${f}; \
	  $(CP) $(BUILD_DIR_32)/$${f}/include/*.h* $(PROTO_DIR)/$(ECPREFIX)/include/$${f}/; \
	  $(CP) $(BUILD_DIR_32)/$${f}/lib$${f}.a $(PROTO_DIR)/$(ECPREFIX)/lib/; \
	  $(CP) $(BUILD_DIR_64)/$${f}/lib$${f}.a $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)/; \
	done
	$(CP) $(BUILD_DIR_32)/mediaServer/live555MediaServer $(PROTO_DIR)/$(ECPREFIX)/bin/
	$(CP) $(BUILD_DIR_32)/proxyServer/live555ProxyServer $(PROTO_DIR)/$(ECPREFIX)/bin/
	$(CP) $(BUILD_DIR_64)/mediaServer/live555MediaServer $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)/
	$(CP) $(BUILD_DIR_64)/proxyServer/live555ProxyServer $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)/
	for f in openRTSP playSIP sapWatch testAMRAudioStreamer \
		testMP3Receiver testMP3Streamer \
		testMPEG1or2AudioVideoStreamer \
		testMPEG1or2AudioVideoToDarwin \
		testMPEG1or2ProgramToTransportStream \
		testMPEG1or2Splitter testMPEG1or2VideoReceiver \
		testMPEG1or2VideoStreamer testMPEG2TransportStreamer \
		testMPEG4VideoStreamer testMPEG4VideoToDarwin \
		testOnDemandRTSPServer testRelay testWAVAudioStreamer \
		MPEG2TransportStreamIndexer \
		vobStreamer; do \
	  $(CP) $(BUILD_DIR_32)/testProgs/$${f} $(PROTO_DIR)/$(ECPREFIX)/bin/; \
	  $(CP) $(BUILD_DIR_64)/testProgs/$${f} $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)/; \
	done
	$(TOUCH) $@
