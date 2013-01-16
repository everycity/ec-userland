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

COMPONENT_NAME=		libyubikey
COMPONENT_FMRI=         library/security/yubico/libyubikey
COMPONENT_VERSION=      1.9
COMPONENT_LICENSE=      libyubikey
COMPONENT_PROJECT_URL=  http://code.google.com/p/yubico-c/
COMPONENT_SUMMARY=	Library for decrypting and parsing YubiKey One-Time Passwords (OTP)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:fb720bd683dd37968904e1ff3d4486307d3d5933f6c6cdc96f81ab27a19c46a6
COMPONENT_ARCHIVE_URL=	http://yubico-c.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

