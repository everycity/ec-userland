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

COMPONENT_NAME=		dbus
COMPONENT_FMRI=         library/dbus
COMPONENT_VERSION=      1.6.8
COMPONENT_LICENSE=      dbus
COMPONENT_PROJECT_URL=  http://www.freedesktop.org/wiki/Software/dbus
COMPONENT_SUMMARY=	The D-Bus message bus system
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:fc1370ef38abeeb13f55c905ec002e60705fb0bfde3b8d21c8d6eb8056c11bac
COMPONENT_ARCHIVE_URL=	http://dbus.freedesktop.org/releases/dbus/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS +=	--disable-tests

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

