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

COMPONENT_NAME=		nettle
COMPONENT_FMRI=         library/security/nettle
COMPONENT_VERSION=      2.7.1
COMPONENT_LICENSE=      LGPLv2.1
COMPONENT_PROJECT_URL=  http://www.lysator.liu.se/~nisse/nettle/
COMPONENT_SUMMARY=	A cryptographic library that is designed to fit easily in more or less any context
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40
COMPONENT_ARCHIVE_URL=	http://www.lysator.liu.se/~nisse/archive/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

