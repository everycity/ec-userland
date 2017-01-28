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

COMPONENT_NAME=		libssh2
COMPONENT_FMRI=         library/libssh2
COMPONENT_VERSION=      1.8.0
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  http://www.libssh2.org/
COMPONENT_SUMMARY=	Client-side C library implementing the SSH2 protocol
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4
COMPONENT_ARCHIVE_URL=	https://www.libssh2.org/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
