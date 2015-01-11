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

COMPONENT_NAME=		lzo
COMPONENT_FMRI=		library/lzo
COMPONENT_VERSION=	2.08
IPS_COMPONENT_VERSION=	2.0.8
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.oberhumer.com/opensource/lzo/"
COMPONENT_SUMMARY=	LZO is a portable lossless data compression library written in ANSI C
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ac1b3e4dee46febe9fd28737eb7f5692d3232ef1a01da10444394c3d47536614
COMPONENT_ARCHIVE_URL=	http://www.oberhumer.com/opensource/lzo/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-static=no
CONFIGURE_OPTIONS+=	--enable-shared

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

