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

COMPONENT_NAME=		vo-aacenc
COMPONENT_FMRI=		library/vo-aacenc
COMPONENT_VERSION=	0.1.2
COMPONENT_LICENSE=	Apache V2
COMPONENT_PROJECT_URL=	http://opencore-amr.sf.net
COMPONENT_SUMMARY=	VisualOn AAC audio codec
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d1911edba77f0406aa45ef630cdf340a4f35fd42e1d37a6e3ee01365d86f3959
COMPONENT_ARCHIVE_URL=	http://downloads.sourceforge.net/project/opencore-amr/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

