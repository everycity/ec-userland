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

COMPONENT_NAME=		gnome-vfs
COMPONENT_FMRI=         library/gnome/gnome-vfs
COMPONENT_VERSION=      2.24.4
COMPONENT_LICENSE=      GPL LGPL
COMPONENT_PROJECT_URL=  https://developer.gnome.org/gnome-vfs/
COMPONENT_SUMMARY=	Filesystem Abstraction Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:2eb84be8d260e3c4f13b68e820acf4100e97956f6953067a99119fa8d88c5c00
COMPONENT_ARCHIVE_URL=	http://ftp.gnome.org/pub/GNOME/sources/gnome-vfs/2.24/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

COMPONENT_PREP_ACTION = ( cd $(@D) && rm -f configure && autoconf )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

