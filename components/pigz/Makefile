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

COMPONENT_NAME=		pigz
COMPONENT_FMRI=		compress/pigz
COMPONENT_VERSION=	2.3.1
COMPONENT_LICENSE=	pigz
COMPONENT_PROJECT_URL=	"http://zlib.net/pigz/"
COMPONENT_SUMMARY=	Parallel GZIP Implementation
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:629b0ce5422a3978f31742bf8275d0be2f84987140d18f390f1e3b4e46e0af54
COMPONENT_ARCHIVE_URL=	http://zlib.net/pigz/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CFLAGS += -std=gnu99
COMPONENT_BUILD_ENV+=	CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(BUILD_32_and_64)
	$(MKDIR) $(PROTO_DIR)/$(USRDIR)/bin/$(MACH64)
	$(INSTALL) $(BUILD_DIR_32)/pigz $(PROTO_DIR)/$(USRDIR)/bin/
	$(INSTALL) $(BUILD_DIR_32)/unpigz $(PROTO_DIR)/$(USRDIR)/bin/
	$(INSTALL) $(BUILD_DIR_64)/pigz $(PROTO_DIR)/$(USRDIR)/bin/$(MACH64)/
	$(INSTALL) $(BUILD_DIR_64)/unpigz $(PROTO_DIR)/$(USRDIR)/bin/$(MACH64)/
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
