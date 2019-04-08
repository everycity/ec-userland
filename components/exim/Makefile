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
# Copyright 2019, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		exim
COMPONENT_FMRI=		mailserver/exim
COMPONENT_VERSION=	4.92
IPS_COMPONENT_VERSION=	4.92.0
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.exim.org/"
COMPONENT_SUMMARY=	The Exim SMTP Server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:89ce0d123f44c466cad596a84e2346fdb6fbf62f983cc0daf40ebd679e604989
COMPONENT_ARCHIVE_URL=	https://ftp.exim.org/pub/exim/exim4/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

# Build isn't thread safe
COMPONENT_BUILD_GMAKE_ARGS=

COMPONENT_PREP_ACTION+= cp $(SOURCE_DIR)/src/EDITME $(SOURCE_DIR)/Local/Makefile
COMPONENT_PRE_BUILD_ACTION+=	cp -r $(SOURCE_DIR)/* $(@D)
COMPONENT_INSTALL_ENV+= DESTDIR=$(PROTO_DIR)
COMPONENT_POST_INSTALL_ACTION += \
	( $(MKDIR) -p $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/log/exim \
	&& touch $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/log/exim/main.log \
	&& touch $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/log/exim/panic.log \
	&& touch $(PROTO_DIR)$(CONFIGURE_LOCALSTATEDIR)/log/exim/reject.log )

build:		$(BUILD_32)

install:	$(INSTALL_32)

