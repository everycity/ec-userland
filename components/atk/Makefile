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

COMPONENT_NAME=		atk
COMPONENT_FMRI=         library/gnome/atk
COMPONENT_VERSION_MJR=	2.16
COMPONENT_VERSION_MNR=	0
COMPONENT_VERSION=	$(COMPONENT_VERSION_MJR).$(COMPONENT_VERSION_MNR)
COMPONENT_LICENSE=      LGPLv2
COMPONENT_PROJECT_URL=  "https://developer.gnome.org/atk/"
COMPONENT_SUMMARY=	GNOME Accesibility Toolkit Libraries
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:095f986060a6a0b22eb15eef84ae9f14a1cf8082488faa6886d94c37438ae562
COMPONENT_ARCHIVE_URL=	http://ftp.acc.umu.se/pub/GNOME/sources/$(COMPONENT_NAME)/$(COMPONENT_VERSION_MJR)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

