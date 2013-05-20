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
# Copyright 2012 Audioboo Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		vo-amrwbenc
COMPONENT_FMRI=		library/vo-amrwbenc
COMPONENT_VERSION=	0.1.2
COMPONENT_LICENSE=	Apache V2
COMPONENT_PROJECT_URL=	http://opencore-amr.sf.net
COMPONENT_SUMMARY=	VisualOn AMR WB encoder library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:dd8c33e57bc415754f31fbb1b1536563bf731fc14e55f8182564e4c0fbb26435
COMPONENT_ARCHIVE_URL=	http://downloads.sourceforge.net/project/opencore-amr/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

