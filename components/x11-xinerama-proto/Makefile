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

COMPONENT_NAME=		xineramaproto
COMPONENT_FMRI=         x11/header/xinerama-protocols
COMPONENT_VERSION=      1.2.1
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://cgit.freedesktop.org/xorg/proto/xineramaproto/"
COMPONENT_SUMMARY=	X.org XineramaProto protocol headers.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d99e121edf7b310008d7371ac5dbe3aa2810996d476b754dc78477cc26e5e7c1
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_PROTO)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

