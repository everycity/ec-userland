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

COMPONENT_NAME=		sysbench
COMPONENT_FMRI=         benchmark/sysbench
COMPONENT_VERSION=      0.4.12
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://sysbench.sourceforge.net
COMPONENT_SUMMARY=	SysBench system performance evaluation benchmark
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e
COMPONENT_ARCHIVE_URL=	http://downloads.sourceforge.net/project/sysbench/sysbench/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#PATH.32=$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
#PATH.64=$(USRDIR)/bin/$(MACH64):$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
#PATH=$(PATH.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) && \
	touch NEWS AUTHORS && \
	libtoolize --force --copy && autoreconf )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

