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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libcdr
COMPONENT_FMRI=         library/libcdr
COMPONENT_VERSION=      0.1.2
COMPONENT_LICENSE=      MPLv2.0
COMPONENT_PROJECT_URL=  "http://www.freedesktop.org/wiki/Software/libcdr/"
COMPONENT_SUMMARY=	Libcdr provides the ability to interpret and import Corel Draw drawings into various applications
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:f29e95c28a057a9f96d20743a8eda49ae4f0da0734a1498cec631158704251e3
COMPONENT_ARCHIVE_URL=	http://dev-www.libreoffice.org/src/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CXXFLAGS+=	-pthread
CONFIGURE_OPTIONS+=	--disable-werror

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

