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

COMPONENT_NAME=		java-jna
COMPONENT_FMRI=		library/java/java-jna
COMPONENT_VERSION=	3.5.1
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_PROJECT_URL=	https://github.com/twall/jna
COMPONENT_SUMMARY=	Dynamic access of native libraries from Java without JNI

COMPONENT_ARCHIVE_1=	jna-$(COMPONENT_VERSION).jar
COMPONENT_ARCHIVE_HASH_1=	sha256:3f8889f51d570a26f3ac2c1323e6be828bb73eb5e66cf25e979eb5b109d92021
COMPONENT_ARCHIVE_URL_1=	https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE_1)

COMPONENT_ARCHIVE_2=	platform-$(COMPONENT_VERSION).jar
COMPONENT_ARCHIVE_HASH_2=	sha256:b0b30404f6a9e29d4d9a7b53fd47322e7137cab3846fd5f149d5589fc68c2126
COMPONENT_ARCHIVE_URL_2=	https://maven.java.net/content/repositories/releases/net/java/dev/jna/platform/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE_2)

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
	$(CP) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_1) $(PROTO_DIR)$(USRDIR)/share/java
	$(CP) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_2) $(PROTO_DIR)$(USRDIR)/share/java/jna-platform-$(COMPONENT_VERSION).jar
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)
