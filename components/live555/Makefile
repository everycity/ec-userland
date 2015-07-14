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

COMPONENT_NAME=		live555
COMPONENT_FMRI=		multimedia/live555
COMPONENT_VERSION=	2014.10.21
IPS_COMPONENT_VERSION=	2014.10.21
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_PROJECT_URL=	http://www.live555.com/
COMPONENT_SUMMARY=	Live555 Streaming Media Library
COMPONENT_SRC=		live
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3b6f9e607c575d821cdeca49e0850c71d63e038d43db484f7f975f91393cf0be
COMPONENT_ARCHIVE_URL=	http://www.live555.com/liveMedia/public/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION+=	( $(CP) -R $(SOURCE_DIR)/* $(@D)/ ; cd $(@D) ; ./genMakefiles solaris-$(BITS)bit )

build:		$(BUILD_32_and_64)

# This recipe taken from http://ftp.de.debian.org/debian/pool/main/libl/liblivemedia/
$(BUILD_DIR)/.installed:	build
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/bin
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)
	for f in BasicUsageEnvironment \
		UsageEnvironment liveMedia groupsock; do \
	  $(MKDIR) $(PROTO_DIR)$(USRDIR)/include/$${f}; \
	  $(CP) $(BUILD_DIR_32)/$${f}/include/*.h* $(PROTO_DIR)$(USRDIR)/include/$${f}/; \
	  $(CP) $(BUILD_DIR_32)/$${f}/lib$${f}.a $(PROTO_DIR)$(USRDIR)/lib/; \
	  $(CP) $(BUILD_DIR_64)/$${f}/lib$${f}.a $(PROTO_DIR)$(USRDIR)/lib/$(MACH64)/; \
	done
	$(CP) $(BUILD_DIR_32)/mediaServer/live555MediaServer $(PROTO_DIR)$(USRDIR)/bin/
	$(CP) $(BUILD_DIR_32)/proxyServer/live555ProxyServer $(PROTO_DIR)$(USRDIR)/bin/
	$(CP) $(BUILD_DIR_64)/mediaServer/live555MediaServer $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/
	$(CP) $(BUILD_DIR_64)/proxyServer/live555ProxyServer $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/
	for f in openRTSP playSIP registerRTSPStream sapWatch \
		MPEG2TransportStreamIndexer \
		testAMRAudioStreamer \
		testDVVideoStreamer \
		testH264VideoStreamer \
		testH264VideoToTransportStream \
		testMP3Receiver \
		testMP3Streamer \
		testMPEG1or2AudioVideoStreamer \
		testMPEG1or2ProgramToTransportStream \
		testMPEG1or2Splitter \
		testMPEG1or2VideoReceiver \
		testMPEG1or2VideoStreamer \
		testMPEG2TransportReceiver \
		testMPEG2TransportStreamTrickPlay \
		testMPEG2TransportStreamer \
		testMPEG4VideoStreamer \
		testOnDemandRTSPServer \
		testRTSPClient \
		testRelay \
		testReplicator \
		testWAVAudioStreamer \
		vobStreamer; do \
	  $(CP) $(BUILD_DIR_32)/testProgs/$${f} $(PROTO_DIR)$(USRDIR)/bin/; \
	  $(CP) $(BUILD_DIR_64)/testProgs/$${f} $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/; \
	done
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
