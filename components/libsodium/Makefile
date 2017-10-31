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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libsodium
COMPONENT_FMRI=         library/libsodium
COMPONENT_VERSION=      1.0.15
COMPONENT_LICENSE=      ISC
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=  "https://libsodium.org/"
COMPONENT_SUMMARY=	A modern and easy-to-use crypto library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:fb6a9e879a2f674592e4328c5d9f79f082405ee4bb05cb6e679b90afe9e178f4
COMPONENT_ARCHIVE_URL=	https://download.libsodium.org/libsodium/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

