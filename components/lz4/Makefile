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

COMPONENT_NAME=		lz4
COMPONENT_VERSION=	85
IPS_COMPONENT_VERSION=	0.0.1.$(COMPONENT_VERSION)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:75309399e4be2348ad67bbc9916bde391dc76b1f52e1415cdf80f9e7017167c0
COMPONENT_ARCHIVE_URL=	http://linux01.everycity.co.uk/~aszeszo/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ARGS += CC="$(CC) $(CC_BITS)"
COMPONENT_BUILD_ARGS += \
    CFLAGS="$(CFLAGS) $(CPP_LARGEFILES) -I. -std=c99 -Wall -W -Wundef -Wno-implicit-function-declaration"
COMPONENT_BUILD_ARGS += EXT=
COMPONENT_BUILD_TARGETS = lz4demo

BINDIR.32 = $(USRDIR)/bin
BINDIR.64 = $(USRDIR)/bin/$(MACH64)

$(BUILD_DIR)/%/.installed: $(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)$(BINDIR.$(BITS))
	$(CP) $(@D)/lz4demo $(PROTO_DIR)$(BINDIR.$(BITS))/lz4
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
