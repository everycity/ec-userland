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

COMPONENT_NAME=		fontconfig
COMPONENT_FMRI=		library/fontconfig
COMPONENT_VERSION=	2.11.0
COMPONENT_LICENSE=	FontConfig
COMPONENT_PROJECT_URL=	"http://www.freedesktop.org/wiki/Software/fontconfig"
COMPONENT_SUMMARY=	Fontconfig is a library for configuring and customizing font access
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:274c047487b90dacbaa55f4d70b8cdcd556944e7251ce9cf1de442c00a16343b
COMPONENT_ARCHIVE_URL=	http://www.freedesktop.org/software/$(COMPONENT_NAME)/release/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

