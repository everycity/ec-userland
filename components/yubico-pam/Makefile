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

COMPONENT_NAME=		pam_yubico
COMPONENT_FMRI=         library/security/yubico/yubico-pam
COMPONENT_VERSION=      2.12
COMPONENT_LICENSE=      pam_yubico
COMPONENT_PROJECT_URL=  http://code.google.com/p/yubico-pam/
COMPONENT_SUMMARY=	Pluggable Authentication YubiKey Module
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b3efb41b72191b2ccb0b9cde691bd4ee6df5d8245254dd4f4c4e4bb8886c25c3
COMPONENT_ARCHIVE_URL=	http://yubico-pam.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PAMDIR.32=	$(ECPREFIX)/lib/security
PAMDIR.64=	$(ECPREFIX)/lib/security/$(MACH64)

CONFIGURE_OPTIONS+=	--with-pam-dir=$(PAMDIR.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

