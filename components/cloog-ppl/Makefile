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

COMPONENT_NAME=		cloog-ppl
COMPONENT_VERSION=	0.15.10
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:3d8725487a41e0f06c5d52daad74e279b555b833
COMPONENT_ARCHIVE_URL=	ftp://gcc.gnu.org/pub/gcc/infrastructure/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D) ; libtoolize )

CONFIGURE_OPTIONS  +=	--with-ppl=$(ECPREFIX)
CONFIGURE_OPTIONS  +=	--disable-static

build:		$(BUILD_32)

install:	$(INSTALL_32)
