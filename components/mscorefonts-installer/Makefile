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

COMPONENT_NAME=		msttcorefonts
COMPONENT_SUMMARY=	Microsoft Core fonts for the Web installer
COMPONENT_FMRI=		font/truetype/mscorefonts-installer
COMPONENT_VERSION=	3.5
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)_$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3ceabe1e8e6c888aab287add65e8c83c5c65c695f192978e66af3450f7066432
COMPONENT_ARCHIVE_URL=	http://ftp.de.debian.org/debian/pool/contrib/m/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

configure build:

install: prep
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/bin
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/share/doc/mscorefonts
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/share/fonts/truetype/msttcorefonts
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/share/mscorefonts
	cp $(SOURCE_DIR)/update-ms-fonts $(PROTO_DIR)$(USRDIR)/bin/mscorefonts-installer
	cp $(SOURCE_DIR)/cabfiles.sha256sums $(PROTO_DIR)$(USRDIR)/share/mscorefonts
	chmod +x $(PROTO_DIR)$(USRDIR)/bin/mscorefonts-installer
