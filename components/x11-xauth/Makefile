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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		xauth
COMPONENT_FMRI=         x11/session/xauth
COMPONENT_VERSION=      1.0.9
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://cgit.freedesktop.org/xorg/app/xauth/"
COMPONENT_SUMMARY=	X authority file utility
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0709070caf23ba2fb99536907b75be1fe31853999c62d3e87a6a8d26ba8a8cdb
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_APP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

