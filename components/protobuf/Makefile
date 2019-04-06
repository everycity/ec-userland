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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		protobuf
COMPONENT_FMRI=         library/protobuf
COMPONENT_VERSION=      3.7.1
COMPONENT_LICENSE=      BSD
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=  $(PROJECT_CODE_GOOGLE_P)
COMPONENT_SUMMARY=	protocol buffers C++ library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	v$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:f1748989842b46fa208b2a6e4e2785133cfcc3e4d43c17fecb023733f0f5443f
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GITHUB1)
GITHUB_PROJECT=		google

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CXXFLAGS += -std=c++11
CXXFLAGS += -std=c++14

COMPONENT_PREP_ACTION=	( cd $(@D); ./autogen.sh )

CONFIGURE_OPTIONS.32+=	--disable-64bit-solaris

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
