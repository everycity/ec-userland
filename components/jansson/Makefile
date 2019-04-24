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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		jansson
COMPONENT_FMRI=         library/jansson
COMPONENT_VERSION=      2.12
COMPONENT_LICENSE=      MIT
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=  "http://www.digip.org/jansson/"
COMPONENT_SUMMARY=	C library for encoding, decoding and manipulating JSON data
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c7027d2c9
COMPONENT_ARCHIVE_URL=	http://www.digip.org/jansson/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

