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
COMPONENT_VERSION=	49.1.1
COMPONENT_OTHER_VERSION=49_1_1
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	icu4c-$(COMPONENT_OTHER_VERSION)-src.tgz
COMPONENT_ARCHIVE_HASH=	sha1:f407d7e2808b76e3a6ca316aab896aef74bf6722
COMPONENT_ARCHIVE_URL=	\
    http://download.icu-project.org/files/icu4c/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

MYCC.32 = $(CC) -march=i686
MYCC.64 = $(CC)
MYCC = $(MYCC.$(BITS))

CONFIGURE_ENV += CC="$(MYCC)"

CONFIGURE_SCRIPT= $(SOURCE_DIR)/source/configure

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
