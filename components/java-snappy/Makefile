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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		snappy-java
COMPONENT_FMRI=		library/java/java-snappy
COMPONENT_VERSION=	1.0.5.3
JAR_VERSION=		1.0.5-M3-EC
COMPONENT_LICENSE=	APLv2.0
COMPONENT_PROJECT_URL=	http://xerial.org/snappy-java/
COMPONENT_SUMMARY=	Snappy for Java, a fast compressor/decompresser

COMPONENT_ARCHIVE=	snappy-java-$(JAR_VERSION).jar
COMPONENT_ARCHIVE_HASH=	sha256:1dbfd02262a7161e9da8942049d77798092e9b13838333efcf01e5dceb48ff7b
#COMPONENT_ARCHIVE_URL=	http://xerial.org/snappy-java/downloads/snappy-java-$(JAR_VERSION).jar
COMPONENT_ARCHIVE_URL=	http://linux01.everycity.co.uk/~aszeszo/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

$(SOURCE_DIR)/.unpacked: download Makefile $(PATCHES)
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(TOUCH) $@

$(BUILD_DIR)/%/.built: $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed: $(BUILD_DIR)/%/.built
	[ -d $(PROTO_DIR)$(USRDIR)/share/java ] || $(MKDIR) $(PROTO_DIR)$(USRDIR)/share/java
	$(CP) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE) $(PROTO_DIR)$(USRDIR)/share/java/snappy-java-$(COMPONENT_VERSION).jar
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)
