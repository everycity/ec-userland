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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libgd
COMPONENT_VERSION=	2.0.33
COMPONENT_SRC=		GD_2_0_33
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:2f7d6b2d76c7be2891085be6e7c7f3ccbbde0d26
COMPONENT_ARCHIVE_URL=	https://bitbucket.org/pierrejoye/gd-libgd/get/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_POST_UNPACK_ACTION = ( ${MV} pierrejoye-gd-$(COMPONENT_NAME)-$(COMPONENT_SRC)/src $(COMPONENT_SRC) ; \
	${RM} -r pierrejoye-gd-$(COMPONENT_NAME)-$(COMPONENT_SRC) )

LDFLAGS += -liconv

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

