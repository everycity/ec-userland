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

COMPONENT_NAME=		pigz
COMPONENT_VERSION=	2.2.5
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
#COMPONENT_ARCHIVE_HASH=	sha256:
COMPONENT_ARCHIVE_URL=	http://zlib.net/pigz/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

COMPONENT_BUILD_ENV.32+=LDFLAGS=-R$(ECPREFIX)/lib
COMPONENT_BUILD_ENV.64+=LDFLAGS=-R$(ECPREFIX)/lib/$(MACH64)
COMPONENT_BUILD_ENV+=$(COMPONENT_BUILD_ENV.$(BITS))

build:		$(BUILD_32_and_64)

install:        build
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_32)/pigz $(PROTO_DIR)/$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_32)/unpigz $(PROTO_DIR)/$(ECPREFIX)/bin/
	$(INSTALL) $(BUILD_DIR_64)/pigz $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)/
	$(INSTALL) $(BUILD_DIR_64)/unpigz $(PROTO_DIR)/$(ECPREFIX)/bin/$(MACH64)/


