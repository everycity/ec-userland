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

COMPONENT_NAME=		pango
COMPONENT_FMRI=		library/pango
COMPONENT_VERSION=	1.36.1
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.pango.org/"
COMPONENT_SUMMARY=	Layout and rendering of internationalized text
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:42e4b51cdc99e6878a9ea2a5ef2b31b79c1033f8518726df738a3c54c90e59f8
COMPONENT_ARCHIVE_URL=	http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

