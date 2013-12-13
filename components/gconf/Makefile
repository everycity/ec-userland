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

COMPONENT_NAME=		GConf
COMPONENT_FMRI=         gnome/config/gconf
COMPONENT_VERSION=      2.9.91
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  https://projects.gnome.org/gconf/
COMPONENT_SUMMARY=	GConf is a system for storing application preferences
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:62699230c521a8162dae349a2ffe0c9be9d54cf7746286d66947a1dfd775adea
COMPONENT_ARCHIVE_URL=	ftp://ftp.gnome.org/pub/GNOME/sources/GConf/2.9/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

