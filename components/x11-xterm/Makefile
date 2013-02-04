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
# Copyright 2012-2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		xterm
COMPONENT_VERSION=	288
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:aaa1d9fab8da3010dced60b4fd41be5ec27c37ea5d5a0c1d5d8693b51ee75533
COMPONENT_ARCHIVE_URL=	http://invisible-island.net/datafiles/release/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

