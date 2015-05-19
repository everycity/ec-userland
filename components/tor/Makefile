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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tor
COMPONENT_FMRI=		security/tor
COMPONENT_VERSION=	0.2.3.25
COMPONENT_LICENSE=	Tor
COMPONENT_PROJECT_URL=	https://www.torproject.org/
COMPONENT_SUMMARY=	Tor online anonymiser
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:bb2d6f1136f33e11d37e6e34184143bf191e59501613daf33ae3d6f78f3176a0
COMPONENT_ARCHIVE_URL=	https://www.torproject.org/dist/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-openssl-dir=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-zlib-dir=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

