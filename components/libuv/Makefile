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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libuv
COMPONENT_FMRI=         library/libuv
COMPONENT_VERSION=      1.20.0
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "https:libuv.org"
COMPONENT_SUMMARY=	libuv is a multi-platform support library with a focus on asynchronous I/O
COMPONENT_SRC=		$(COMPONENT_NAME)-v$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d19334d8db40cc92ace4b77bd0317d1c878e1a321afa2b7974f084dd3ed8b5e6
COMPONENT_ARCHIVE_URL=	https://dist.libuv.org/dist/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D) ; $(SHELL) ./autogen.sh )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

