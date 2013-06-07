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
# Copyright 2011-2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		yamdi
COMPONENT_VERSION=	1.9
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:4a6630f27f6c22bcd95982bf3357747d19f40bd98297a569e9c77468b756f715
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

$(BUILD_DIR)/$(MACH32)/.built:             BITS=32
$(BUILD_DIR)/$(MACH64)/.built:             BITS=64

CLEAN_PATHS +=	$(BUILD_DIR)

$(BUILD_DIR)/%/.built:	prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	(cd $(@D) ; $(CC) $(SOURCE_DIR)/yamdi.c -o yamdi -O2 -Wall -D_FILE_OFFSET_BITS=64)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/$(MACH32)/.installed:      $(BUILD_DIR)/$(MACH32)/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)$(BINDIR)
	$(CP) $(BUILD_DIR)/$(MACH32)/yamdi $(PROTO_DIR)$(ECPREFIX)$(BINDIR)
	$(TOUCH) $@

$(BUILD_DIR)/$(MACH64)/.installed:      $(BUILD_DIR)/$(MACH64)/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)$(BINDIR)/$(MACH64)
	$(CP) $(BUILD_DIR)/$(MACH64)/yamdi $(PROTO_DIR)$(ECPREFIX)$(BINDIR)/$(MACH64)
	$(TOUCH) $@

install:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/man/man1
	$(CP) $(SOURCE_DIR)/man1/yamdi.1 $(PROTO_DIR)$(ECPREFIX)/share/man/man1
