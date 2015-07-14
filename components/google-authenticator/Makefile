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

COMPONENT_NAME=		google-authenticator
COMPONENT_FMRI=         library/security/google/google-authenticator-pam
COMPONENT_VERSION=      1.0
COMPONENT_LICENSE=      APL20
COMPONENT_PROJECT_URL=  https://code.google.com/p/google-authenticator/
COMPONENT_SUMMARY=	The Google Authenticator project includes implementations of one-time passcode generators for several mobile platforms, as well as a pluggable authentication module (PAM)
COMPONENT_SRC=		libpam-$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-source.tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:80426045d13ce7a2bf56c692ccfb1751cef3c7484752ad40738facf729264d4b
COMPONENT_ARCHIVE_URL=	https://google-authenticator.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/lib/security/$(MACH64)
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)
	$(CP) $(BUILD_DIR)/$(MACH32)/pam_google_authenticator.so $(PROTO_DIR)$(USRDIR)/lib/security/
	$(CP) $(BUILD_DIR)/$(MACH64)/pam_google_authenticator.so $(PROTO_DIR)$(USRDIR)/lib/security/$(MACH64)/
	$(CP) $(BUILD_DIR)/$(MACH32)/google-authenticator $(PROTO_DIR)$(USRDIR)/bin/
	$(CP) $(BUILD_DIR)/$(MACH64)/google-authenticator $(PROTO_DIR)$(USRDIR)/bin/$(MACH64)/
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32)

