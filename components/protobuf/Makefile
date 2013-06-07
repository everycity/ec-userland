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

COMPONENT_NAME=		protobuf
COMPONENT_FMRI=         library/protobuf
COMPONENT_VERSION=      2.5.0
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  $(PROJECT_CODE_GOOGLE_P)
COMPONENT_SUMMARY=	protocol buffers C++ library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:13bfc5ae543cf3aa180ac2485c0bc89495e3ae711fc6fab4f8ffe90dfb4bb677
COMPONENT_ARCHIVE_URL=	https://protobuf.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=--disable-static

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

