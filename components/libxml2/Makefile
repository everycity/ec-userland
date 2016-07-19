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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libxml2
COMPONENT_FMRI=		library/libxml2
COMPONENT_VERSION=	2.9.4
COMPONENT_LICENSE=	MIT
COMPONENT_PROJECT_URL=	"http://xmlsoft.org/"
COMPONENT_SUMMARY=	The XML library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ffb911191e509b966deb55de705387f14156e1a56b21824357cdf0053233633c
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XMLSOFT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+= --with-python=/ec

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

