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

COMPONENT_NAME=		libunistring
COMPONENT_FMRI=		library/libunistring
COMPONENT_VERSION=	0.9.5
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/libunistring/"
COMPONENT_SUMMARY=	Unicode string library for C
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1a8c0772467850bef7197318a95f44abbb678ea83cbf119a3500cc7848276a17
COMPONENT_ARCHIVE_URL=	http://ftp.gnu.org/gnu/libunistring/$(COMPONENT_ARCHIVE)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

CONFIGURE_ENV+=	AR="$(LD_PRELOAD_AR)"

build:			$(BUILD_32_and_64)

install:		$(INSTALL_32_and_64)

test: $(NO_TESTS)

BUILD_PKG_DEPENDENCIES = $(BUILD_TOOLS)

include $(WS_TOP)/make-rules/depend.mk
