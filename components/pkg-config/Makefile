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
# Copyright 2011,2012 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pkg-config
COMPONENT_VERSION=	0.25
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3ba691ee2431f32ccb8efa131e59bf23e37f122dc66791309023ca6dcefcd10e
COMPONENT_ARCHIVE_URL=	http://$(COMPONENT_NAME).freedesktop.org/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS  +=           --disable-static

CONFIGURE_OPTIONS.32 +=		ABI=32
CONFIGURE_OPTIONS.64 +=		ABI=64


build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

