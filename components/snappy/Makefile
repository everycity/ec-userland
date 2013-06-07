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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		snappy
COMPONENT_FMRI=		library/snappy
COMPONENT_VERSION=	1.1.0
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	$(PROJECT_CODE_GOOGLE_P)
COMPONENT_SUMMARY=	Fast compression/decompression library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1fa82bc588bb93fa74dfc0e2e9b7d63b6e2a20ede323ef42bf0af0f947676160
COMPONENT_ARCHIVE_URL=	https://snappy.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
