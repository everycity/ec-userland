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

COMPONENT_NAME=		raptor2
COMPONENT_FMRI=         library/raptor2
COMPONENT_VERSION=      2.0.12
COMPONENT_LICENSE=      Apache2.0
COMPONENT_PROJECT_URL=  "http://librdf.org/"
COMPONENT_SUMMARY=	Raptor RDF syntax library for parsing and serializing RDF syntaxes
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b1955565f47e33f8872aa3d5d8e5f246c6c572e84ebeb4910966166e6d508498
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_LIBRDF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

