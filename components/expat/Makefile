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
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		expat
COMPONENT_VERSION=	2.1.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86
COMPONENT_ARCHIVE_URL=	http://downloads.sourceforge.net/project/expat/expat/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_POST_INSTALL_ACTION = ( strip \
                $(PROTO_DIR)$(ECPREFIX)/bin/* \
                $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/* \
                $(PROTO_DIR)$(ECPREFIX)/lib/*so* \
                $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/*so* \
                >/dev/null 2>&1; true )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
