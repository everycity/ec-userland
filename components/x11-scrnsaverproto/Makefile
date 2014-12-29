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

COMPONENT_NAME=		scrnsaverproto
COMPONENT_FMRI=         x11/header/scrnsaverproto
COMPONENT_VERSION=      1.2.2
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://cgit.freedesktop.org/xorg/proto/scrnsaverproto/"
COMPONENT_SUMMARY=	X.org ScrnSaverProto protocol headers.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d8dee19c52977f65af08fad6aa237bacee11bc5a33e1b9b064e8ac1fd99d6e79
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_PROTO)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

