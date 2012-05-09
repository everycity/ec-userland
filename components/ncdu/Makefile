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

COMPONENT_NAME=		ncdu
COMPONENT_VERSION=	1.8
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:3d98e78cf7035e32333d263d301d12e9b4352598
COMPONENT_ARCHIVE_URL=	http://dev.yorhel.nl/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS.32       +=      "-I$(ECPREFIX)/include -I$(ECPREFIX)/include/ncurses"
CPPFLAGS.32     +=      "-I$(ECPREFIX)/include -I$(ECPREFIX)/include/ncurses"

CONFIGURE_OPTIONS.32 += CFLAGS=$(CFLAGS.$(BITS))
CONFIGURE_OPTIONS.32 += CPPFLAGS=$(CPPFLAGS.$(BITS))
CONFIGURE_OPTIONS+=     LIBS="-L$(ECPREFIX)/lib -lncurses"


build:		$(BUILD_32)

install:	$(INSTALL_32)

