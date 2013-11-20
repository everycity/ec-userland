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
# Copyright 2012-2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		clamav
COMPONENT_FMRI=		security/antivirus/clamav
COMPONENT_VERSION=	0.98
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.clamav.net/"
COMPONENT_SUMMARY=	ClamAV is an open source (GPL) antivirus engine
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:113450537f46ed47f010a179be333a0dcd79eac13f264dce26db7aac8d52b3b6
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-zlib=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--disable-clamav

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

