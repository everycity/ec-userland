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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		librsvg
COMPONENT_FMRI=         library/librsvg
COMPONENT_VERSION=      2.40.5
COMPONENT_LICENSE=      LGPLv2
COMPONENT_PROJECT_URL=  "http://live.gnome.org/LibRsvg"
COMPONENT_SUMMARY=	librsvg is a library to render SVG files using cairo
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:d14d7b3e25023ce34302022fd7c9b3a468629c94dff6c177874629686bfc71a7
COMPONENT_ARCHIVE_URL=	https://download.gnome.org/sources/$(COMPONENT_NAME)/2.40/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

ifeq ($(SOLARIS_VERSION), 2.10)
COMPONENT_EXTRA_PATCH_ACTION=   ($(GPATCH) -d $(@D) $(GPATCH_FLAGS) < librsvg-portability.patch)
endif

CONFIGURE_OPTIONS+=	--enable-introspection=no

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

