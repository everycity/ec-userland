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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		icu
COMPONENT_VERSION=	4.8.1.1
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)4c-4_8_1_1-src.tgz
COMPONENT_ARCHIVE_HASH=	sha1:7146ee269b39273fa98d750f73136b14f781758a
COMPONENT_ARCHIVE_URL=	http://download.icu-project.org/files/icu4c/4.8.1.1/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_SCRIPT   =    $(SOURCE_DIR)/source/configure

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

