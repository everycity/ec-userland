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

COMPONENT_NAME=		fribidi
COMPONENT_FMRI=		library/fribidi
COMPONENT_VERSION=	0.19.6
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_PROJECT_URL=	"http://www.fribidi.org/"
COMPONENT_SUMMARY=	Unicode Bidirectional Algorithm (bidi)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:cba8b7423c817e5adf50d28ec9079d14eafcec9127b9e8c8f1960c5ad585e17d
COMPONENT_ARCHIVE_URL=	http://fribidi.org/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

