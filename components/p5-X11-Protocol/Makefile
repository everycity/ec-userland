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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		X11-Protocol
COMPONENT_VERSION=	0.56
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:de96dd6c7c1f25f3287aa7af64902bf84acaaa8e0c3bb76aa1676367e04a08b7
COMPONENT_ARCHIVE_URL=	http://ftp.heanet.ie/mirrors/ftp.perl.org/pub/CPAN/authors/id/S/SM/SMCCAM/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk
include ../../make-rules/makemaker.mk

build:		$(BUILD_64)

install:	$(INSTALL_64)

