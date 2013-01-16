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

COMPONENT_NAME=		ykpers
COMPONENT_FMRI=         library/security/yubico/yubikey-personalization
COMPONENT_VERSION=      1.11.3
COMPONENT_LICENSE=      ykpers
COMPONENT_PROJECT_URL=  http://code.google.com/p/yubikey-personalization/
COMPONENT_SUMMARY=	Library for reprogramming YubiKeys
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:9c89fa2ffe68612d10e7d4b733372706360abddbc3e7442958023f4f6110dac6
COMPONENT_ARCHIVE_URL=	http://yubikey-personalization.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

