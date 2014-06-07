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

COMPONENT_NAME=		libcaca
COMPONENT_FMRI=		library/libcaca
COMPONENT_VERSION=	0.99.beta19
IPS_COMPONENT_VERSION=	0.99.19
COMPONENT_LICENSE=	DWTFYWTPL,GPLv2,ISC,LGPLv2.1
COMPONENT_PROJECT_URL=	"http://caca.zoy.org/wiki/libcaca"
COMPONENT_SUMMARY=	Library that outputs text instead of pixels
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:128b467c4ed03264c187405172a4e83049342cc8cc2f655f53a2d0ee9d3772f4
COMPONENT_ARCHIVE_URL=	http://caca.zoy.org/files/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS	+=	-lnsl -lsocket -lresolv

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

