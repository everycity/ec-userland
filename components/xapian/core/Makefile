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

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=         xapian-core
COMPONENT_FMRI=		library/xapian/core
COMPONENT_VERSION=      1.2.15
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	http://xapian.org/
COMPONENT_SUMMARY=	Xapian is an Open Source Search Engine Library
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= sha256:cde4f5d1b111b66643fa41c11b9e5962bff7ce7244ca34cbbcbd2d2caa0c4df0
COMPONENT_ARCHIVE_URL=  http://oligarchy.co.uk/xapian/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

LDFLAGS +=	-lsocket

CONFIGURE_OPTIONS +=	--disable-static

build:          $(BUILD_32_and_64)

install:        $(INSTALL_32_and_64)

