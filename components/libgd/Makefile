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

COMPONENT_NAME=		libgd
COMPONENT_VERSION=	2.0.33
COMPONENT_SRC=		GD_2_0_33
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:7cadca0bf389c38d90795516a7995473b749bb4138d00feaf7d3df242bea2b7b
COMPONENT_ARCHIVE_URL=	https://bitbucket.org/libgd/gd-libgd/get/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_POST_UNPACK_ACTION = ( \
	${MV} source/$(COMPONENT_NAME)-gd-$(COMPONENT_NAME)-486e81dea984/src source/$(COMPONENT_SRC) ; \
	${RM} -r source/$(COMPONENT_NAME)-gd-$(COMPONENT_NAME)-$(COMPONENT_SRC) )

LDFLAGS += -liconv

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

