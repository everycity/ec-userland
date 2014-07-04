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

COMPONENT_NAME=		intltool
COMPONENT_FMRI=         text/intltool
COMPONENT_VERSION=      0.50.2
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://freedesktop.org/wiki/Software/intltool/
COMPONENT_SUMMARY=	Internationalization Tool Collection
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:67f25c5c6fb71d095793a7f895b245e65e829e8bde68c6c8b4c912144ff34406
COMPONENT_ARCHIVE_URL=	https://launchpad.net/intltool/trunk/$(COMPONENT_VERSION)/+download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_BINDIR.64 = $(CONFIGURE_BINDIR.32)

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_64)

install:	$(INSTALL_64)
