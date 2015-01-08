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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		jq
COMPONENT_FMRI=         text/jq
COMPONENT_VERSION=      1.4
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://stedolan.github.io/jq/"
COMPONENT_SUMMARY=	jq is a lightweight and flexible command-line JSON processor
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:998c41babeb57b4304e65b4eb73094279b3ab1e63801b6b4bddd487ce009b39d
COMPONENT_ARCHIVE_URL=	http://stedolan.github.io/jq/download/source/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

