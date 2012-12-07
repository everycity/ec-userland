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

COMPONENT_NAME=		libee
COMPONENT_VERSION=	0.4.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c0dac01938593deee06c3d161e4eda4ecc0fd7317e1321bd96e301aceb7fb027
COMPONENT_ARCHIVE_URL=	http://www.libee.org/download/files/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# make build isn't thread safe.
override COMPONENT_BUILD_GMAKE_ARGS=

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

