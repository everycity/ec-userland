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

COMPONENT_NAME=		libnghttp2
COMPONENT_FMRI=         library/libnghttp2
COMPONENT_VERSION=      1.32.0
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  https://nghttp2.org/
COMPONENT_SUMMARY=	ghttp2 is an implementation of HTTP/2 and its header compression algorithm HPACK in C
COMPONENT_SRC=		nghttp2-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:0660816fa83494471d7bff3c556d5a7c2ff07fb6ffa6b2d06bdbdb45ee6a964a
COMPONENT_ARCHIVE_URL=	https://github.com/nghttp2/nghttp2/releases/download/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
