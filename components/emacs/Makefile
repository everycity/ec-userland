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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=			emacs
COMPONENT_VERSION=		23.3
COMPONENT_ARCHIVE_VERSION=	23.3b
COMPONENT_SRC=			$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=		$(COMPONENT_NAME)-$(COMPONENT_ARCHIVE_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=		sha256:86dcab9a3046ecb2bd1ebdb1f15157cc60e4ded6ef0d7950bbbfc027d7c2e6ee
COMPONENT_ARCHIVE_URL=		$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

