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

COMPONENT_NAME=		dbus-glib
COMPONENT_FMRI=         library/dbus-glib
COMPONENT_VERSION=      0.100
COMPONENT_LICENSE=      dbus-glib
COMPONENT_PROJECT_URL=  http://www.freedesktop.org/wiki/Software/DBusBindings
COMPONENT_SUMMARY=	The D-Bus message bus system - Glib Bindings
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:80ddf7584a659590103817798dd95d7e451d666f385e5e95a83abf85c46d4605
COMPONENT_ARCHIVE_URL=	http://dbus.freedesktop.org/releases/dbus-glib/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

