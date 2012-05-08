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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		zetaback
COMPONENT_VERSION=	1.0.5
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
    sha256:a26f83a0a851e3ef2924189533aebb1f3ed759607b32d5a74574f165a4065b5f
COMPONENT_ARCHIVE_URL=	https://mirrors.omniti.com/zetaback/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL=	http://labs.omniti.com/labs/zetaback

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = \
    $(CLONEY) $(SOURCE_DIR) $(@D)

build:		$(BUILD_32)

install:	$(INSTALL_32)

test:		$(NO_TESTS)
