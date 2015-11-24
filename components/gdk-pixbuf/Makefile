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

COMPONENT_NAME=		gdk-pixbuf
COMPONENT_FMRI=         library/gdk-pixbuf
COMPONENT_VERSION_MJR=	2.32
COMPONENT_VERSION=      $(COMPONENT_VERSION_MJR).2
COMPONENT_LICENSE=      LGPLv2
COMPONENT_PROJECT_URL=  "https://git.gnome.org/browse/gdk-pixbuf/"
COMPONENT_SUMMARY=	GDK-Pixbuf is a toolkit for image loading and pixel buffer manipulation
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:d3ab06fc123b13effed4c27c77cebdfad2173ff20628d82c397b7660ae926145
COMPONENT_ARCHIVE_URL=	http://ftp.gnome.org/pub/GNOME/sources/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

