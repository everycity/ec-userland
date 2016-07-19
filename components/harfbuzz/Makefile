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

COMPONENT_NAME=		harfbuzz
COMPONENT_FMRI=         library/harfbuzz
COMPONENT_VERSION=      1.2.7
COMPONENT_LICENSE=      Old MIT
COMPONENT_PROJECT_URL=  "http://www.freedesktop.org/wiki/Software/HarfBuzz/"
COMPONENT_SUMMARY=	HarfBuzz is an OpenType text shaping engine
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:bba0600ae08b84384e6d2d7175bea10b5fc246c4583dc841498d01894d479026
COMPONENT_ARCHIVE_URL=	https://www.freedesktop.org/software/$(COMPONENT_NAME)/release/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

