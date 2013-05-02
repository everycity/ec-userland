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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		watch
COMPONENT_FMRI=		terminal/watch
COMPONENT_VERSION=      3.2.8
COMPONENT_LICENSE=      GPL
COMPONENT_PROJECT_URL=  http://procps.sourceforge.net/
COMPONENT_SUMMARY=	A utility that runs a command at periodic intervals and displays the output
COMPONENT_SRC=		procps-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:11ed68d8a4433b91cd833deb714a3aa849c02aea738c42e6b4557982419c1535
COMPONENT_ARCHIVE_URL=	http://procps.sourceforge.net/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_TARGETS=watch
COMPONENT_BUILD_ARGS+=CC=$(CC) CFLAGS=-I/ec/include/ncurses

# install the built source into a prototype area
$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin
	$(CP) $(@D)/watch $(PROTO_DIR)$(ECPREFIX)/bin/
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)

