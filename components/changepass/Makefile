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

COMPONENT_NAME=		cgipaf
COMPONENT_FMRI=		system/utility/changepass
COMPONENT_VERSION=	1.3.3
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	http://www.wagemakers.be/english/programs/cgipaf
COMPONENT_SUMMARY=	Utility for changing system passwords
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ad6485610ff9e1978ad92da98a782e809f6b3a7600e7dc0970ea8f4e37c57fa7
COMPONENT_ARCHIVE_URL=	http://www.wagemakers.be/downloads/cgipaf/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION += $(CLONEY) $(SOURCE_DIR) $(@D)

COMPONENT_BUILD_TARGETS = changepass

$(BUILD_DIR)/%/.installed: $(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/bin
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/share/man/man8
	$(CP) $(@D)/changepass $(PROTO_DIR)$(USRDIR)/bin
	$(CP) $(@D)/changepass.man $(PROTO_DIR)$(USRDIR)/share/man/man8/changepass.8
	$(TOUCH) $@

build:      $(BUILD_32)

install:    $(INSTALL_32)
