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
# Copyright 2019, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		expat
COMPONENT_FMRI=		library/expat
COMPONENT_VERSION=	2.2.6
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	https://libexpat.github.io/
COMPONENT_SUMMARY=	A stream-oriented XML parser library written in C
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:17b43c2716d521369f82fc2dc70f359860e90fa440bea65b3b85f0b246ea81f2
COMPONENT_ARCHIVE_URL=	https://github.com/libexpat/libexpat/releases/download/R_2_2_6/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
