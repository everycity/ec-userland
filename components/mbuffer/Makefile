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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mbuffer
COMPONENT_FMRI=		shell/mbuffer
COMPONENT_VERSION=	20190127
COMPONENT_LICENSE=	GPLv3
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=	"http://www.maier-komor.de/software/mbuffer"
COMPONENT_SUMMARY=	mbuffer - tool for buffering data streams
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH= sha256:c5cb6f94f8083f2e87f88e25f6a379134b48a989925148022e8f611f954ceddc
COMPONENT_ARCHIVE_URL=	http://www.maier-komor.de/software/mbuffer/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

