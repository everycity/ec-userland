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

COMPONENT_NAME=		harfbuzz
COMPONENT_FMRI=         library/harfbuzz
COMPONENT_VERSION=      0.9.25
COMPONENT_LICENSE=      Old MIT
COMPONENT_PROJECT_URL=  "http://www.freedesktop.org/wiki/Software/HarfBuzz/"
COMPONENT_SUMMARY=	HarfBuzz is an OpenType text shaping engine
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:dc6e5997a569526cd28147a80a0f65466e87ae617753b38704a60184bc6d6bee
COMPONENT_ARCHIVE_URL=	http://www.freedesktop.org/software/$(COMPONENT_NAME)/release/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

