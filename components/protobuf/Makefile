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

COMPONENT_NAME=		protobuf
COMPONENT_FMRI=         library/protobuf
COMPONENT_VERSION=      3.2.0
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  $(PROJECT_CODE_GOOGLE_P)
COMPONENT_SUMMARY=	protocol buffers C++ library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	v$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:2a25c2b71c707c5552ec9afdfb22532a93a339e1ca5d38f163fe4107af08c54c
COMPONENT_ARCHIVE_URL=	https://github.com/google/protobuf/archive/$(COMPONENT_ARCHIVE)
COMPONENT_LICENSE_FILE=	LICENSE

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION=	( cd $(@D); ./autogen.sh )

CONFIGURE_OPTIONS+=	--disable-static
CONFIGURE_OPTIONS.32+=	--disable-64bit-solaris

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

