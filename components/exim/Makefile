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
# Copyright 2016, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		exim
COMPONENT_FMRI=		mailserver/exim
COMPONENT_VERSION=	4.89
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.exim.org/"
COMPONENT_SUMMARY=	The Exim SMTP Server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0ecb90622fac9edea2670e25070a4d4a4879c3fb8541a0b96a880dfac86ccf1c
COMPONENT_ARCHIVE_URL=	ftp://ftp.exim.org/pub/exim/exim4/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

# Build isn't thread safe
COMPONENT_BUILD_GMAKE_ARGS=

COMPONENT_PREP_ACTION+= cp $(SOURCE_DIR)/src/EDITME $(SOURCE_DIR)/Local/Makefile
COMPONENT_PRE_BUILD_ACTION+=	cp -r $(SOURCE_DIR)/* $(@D)
COMPONENT_INSTALL_ENV+= DESTDIR=$(PROTO_DIR)
COMPONENT_POST_INSTALL_ACTION+= mkdir -p $(PROTO_DIR)$(ECPREFIX)/var/log/exim ; \
	touch $(PROTO_DIR)$(ECPREFIX)/var/log/exim/main.log ; \
	touch $(PROTO_DIR)$(ECPREFIX)/var/log/exim/panic.log ; \
	touch $(PROTO_DIR)$(ECPREFIX)/var/log/exim/reject.log ; \
	mkdir -p $(PROTO_DIR)$(ECPREFIX)/var/svc/method ; \
	mkdir -p $(PROTO_DIR)/var/svc/manifest/site ; \
	cp $(COMPONENT_DIR)/exim-startup.sh $(PROTO_DIR)$(ECPREFIX)/var/svc/method/exim ; \
	cp $(COMPONENT_DIR)/exim-manifest.xml $(PROTO_DIR)/var/svc/manifest/site/exim.xml

build:		$(BUILD_32)

install:	$(INSTALL_32)

