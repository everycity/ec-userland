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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		flex
COMPONENT_FMRI=		developer/lexer/flex
COMPONENT_VERSION=	2.6.0
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://flex.sourceforge.net/"
COMPONENT_SUMMARY=	flex: the fast lexical analyser is a tool for creating scanners
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS += --infodir=$(ECPREFIX)/share/info

COMPONENT_POST_INSTALL_ACTION = ( strip \
                $(PROTO_DIR)$(ECPREFIX)/bin/* \
                $(PROTO_DIR)$(ECPREFIX)/lib/*so* \
                >/dev/null 2>&1; true )

build:		$(BUILD_32)

install:	$(INSTALL_32)
