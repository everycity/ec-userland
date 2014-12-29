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

ifeq ($(SOLARIS_VERSION), 2.10)
PUBLISH_STAMP=
endif

COMPONENT_NAME=		mtr
COMPONENT_FMRI=		network/mtr
COMPONENT_VERSION=	0.86
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.bitwizard.nl/mtr/"
COMPONENT_SUMMARY=	MTR Traceroute Utility
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c5d948920b641cc35f8b380fc356ddfe07cce6a9c6474afe242fc58113f28c06
COMPONENT_ARCHIVE_URL=	ftp://ftp.bitwizard.nl/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	LIBS="-L$(ECPREFIX)/lib -lncurses"
CONFIGURE_OPTIONS+=	--without-gtk

build_2.10:
	@echo "Not available."
build_2.11:	$(BUILD_32)
build:		build_$(SOLARIS_VERSION)

install_2.10:
	@echo "Not available."
install_2.11:	$(INSTALL_32)
install:	install_$(SOLARIS_VERSION)

