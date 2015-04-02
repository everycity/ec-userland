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

COMPONENT_NAME=		gperftools
COMPONENT_FMRI=         developer/gperftools
COMPONENT_VERSION=      2.4
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  "https://code.google.com/p/gperftools/"
COMPONENT_SUMMARY=	Google developer tools
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:982a37226eb42f40714e26b8076815d5ea677a422fb52ff8bfca3704d9c30a2d
COMPONENT_ARCHIVE_URL=	https://googledrive.com/host/0B6NtGsLhIcf7MWxMMF9JdTN3UVk/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS+=	-std=c99 -D__EXTENSIONS__
CONFIGURE_OPTIONS+=	--enable-frame-pointers

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

