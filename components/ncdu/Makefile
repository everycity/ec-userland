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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ncdu
COMPONENT_FMRI=		file/ncdu
COMPONENT_VERSION=	1.11
COMPONENT_LICENSE=	ncdu
COMPONENT_PROJECT_URL=	"http://dev.yorhel.nl/ncdu"
COMPONENT_SUMMARY=	ncurses disk usage viewer
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d0aea772e47463c281007f279a9041252155a2b2349b18adb9055075e141bb7b
COMPONENT_ARCHIVE_URL=	http://dev.yorhel.nl/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS +=	-I$(ECPREFIX)/include/ncurses

build:		$(BUILD_32)

install:	$(INSTALL_32)

