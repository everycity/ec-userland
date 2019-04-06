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

COMPONENT_NAME=		isl
COMPONENT_FMRI=         library/isl
COMPONENT_VERSION=      0.20
COMPONENT_LICENSE=      MIT
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=  http://isl.gforge.inria.fr/
COMPONENT_SUMMARY=	isl is a library for manipulating sets and relations of integer points bounded by linear constraints
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:a5596a9fb8a5b365cb612e4b9628735d6e67e9178fae134a816ae195017e77aa
COMPONENT_ARCHIVE_URL=	http://isl.gforge.inria.fr/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

