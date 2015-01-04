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
# Copyright 2011, Audioboo Ltd. All rights reserved.
# Copyright 2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		speex
COMPONENT_VERSION=	1.2rc1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f1179cb7a6
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XIPH)

#CONFIGURE_OPTIONS.64+=  'CC=$(CC) $(CC_BITS)' 'CXX=$(CXX) $(CC_BITS)' 'LDFLAGS=-L../../../../libogg/build/amd64/src'

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

