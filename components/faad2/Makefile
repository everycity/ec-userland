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

COMPONENT_NAME=		faad2
COMPONENT_FMRI=		library/audio/faad2
COMPONENT_VERSION=	2.7
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.audiocoding.com/faad2.html"
COMPONENT_SUMMARY=	FAAD2 open source MPEG-4 and MPEG-2 AAC decoder
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ee26ed1e177c0cd8fa8458a481b14a0b24ca0b51468c8b4c8b676fd3ceccd330
SF_PROJECT_NAME=	faac
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=--with-pic --enable-shared --disable-static

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

