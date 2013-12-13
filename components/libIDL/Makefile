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

COMPONENT_NAME=		libIDL
COMPONENT_FMRI=         developer/libIDL
COMPONENT_VERSION=      0.8.14
COMPONENT_LICENSE=      LGPLv2
COMPONENT_PROJECT_URL=  http://ftp.gnome.org/pub/gnome/sources/libIDL
COMPONENT_SUMMARY=	libIDL
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:bca99570f1ab453e11ae627b209561019cde5aaa98f71f43cc6da048d3bc7e72
COMPONENT_ARCHIVE_URL=	http://ftp.gnome.org/pub/gnome/sources/libIDL/0.8/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

