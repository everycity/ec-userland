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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		wkhtmltopdf
COMPONENT_VERSION=	0.11.0_rc1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:db03922d281856e503b3d562614e3936285728c7
COMPONENT_ARCHIVE_URL=	http://wkhtmltopdf.googlecode.com/files/$(COMPONENT_ARCHIVE)

IPS_COMPONENT_VERSION=	0.10.99.1

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION+=	( cp -r $(SOURCE_DIR)/* $(@D) ; cd $(@D) ; \
	$(ECPREFIX)/lib/wkhtmltopdf-qt/bin/qmake )
COMPONENT_INSTALL_ENV+= INSTALL_ROOT=$(PROTO_DIR)/$(ECPREFIX)

build:          $(BUILD_32)

install:        $(INSTALL_32)

