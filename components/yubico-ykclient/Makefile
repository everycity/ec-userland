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

COMPONENT_NAME=		ykclient
COMPONENT_FMRI=         library/security/yubico/yubico-c-client
COMPONENT_VERSION=      2.9
COMPONENT_LICENSE=      ykclient
COMPONENT_PROJECT_URL=  $(CODE_GOOGLE_P)/yubico-c-client/
COMPONENT_SUMMARY=	The Yubico C Client Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:f5f93d77dd9f2e3fd1854f7fcfbbc3cfbf4227c3ebe145c8a3f7a2339efbeca5
COMPONENT_ARCHIVE_URL=	http://yubico-c-client.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

