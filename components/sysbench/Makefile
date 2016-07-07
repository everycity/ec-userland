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

COMPONENT_NAME=		sysbench
COMPONENT_FMRI=         benchmark/sysbench
COMPONENT_VERSION=      0.5
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://sysbench.sourceforge.net
COMPONENT_SUMMARY=	SysBench system performance evaluation benchmark
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8ee380206d843489702c17d7147eb03d28bcd87914468b6cb731d21112231086
COMPONENT_ARCHIVE_URL=	https://github.com/akopytov/sysbench/archive/0.5.tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

PATH.32=$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64=$(ECPREFIX)/bin/$(MACH64):$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH=$(PATH.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) && ./autogen.sh )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

