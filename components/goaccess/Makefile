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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		goaccess
COMPONENT_FMRI=         diagnostic/goaccess
COMPONENT_VERSION=      0.9.6
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://goaccess.io/
COMPONENT_SUMMARY=	An open source real-time web log analyzer and interactive viewer
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e848064c8555f95e770aa1c0475c784c094b42e4ae53ff852975f6498d8f649a
COMPONENT_ARCHIVE_URL=	http://tar.goaccess.io/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CFLAGS+=	-D__EXTENSIONS__ -D_XOPEN_SOURCE=500

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

