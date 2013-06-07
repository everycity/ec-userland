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

# Download the file manually for now
# VERSION=3.17.4
# curl -L --data "FILE=spread-src-${VERSION}.tar.gz&name=-&email=user@example.com&company=-&Stage=Download" \
#   http://www.spread.org/download/spread-src-${VERSION}.tar.gz -o spread-src-${VERSION}.tar.gz

COMPONENT_NAME=		spread
COMPONENT_FMRI=         network/spread
COMPONENT_VERSION=      3.17.4
COMPONENT_LICENSE=      Spread Open-Source License
COMPONENT_PROJECT_URL=  http://www.spread.org/
COMPONENT_SUMMARY=	Distributed application toolkit
COMPONENT_SRC=		$(COMPONENT_NAME)-src-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:7ed2219c5aa64be40f1819577fc9393daa4ca297185fca38d9f4f3292906f324
#COMPONENT_ARCHIVE_URL=	http://www.spread.org/download/$(COMPONENT_ARCHIVE)
COMPONENT_ARCHIVE_URL=	$(EC_ARCHIVE)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

