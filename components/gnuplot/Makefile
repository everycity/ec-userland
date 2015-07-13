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

COMPONENT_NAME=		gnuplot
COMPONENT_FMRI=		image/gnuplot
COMPONENT_VERSION=	4.6.6
COMPONENT_LICENSE=	4 clause BSD
COMPONENT_PROJECT_URL=	"http://gnuplot.info/"
COMPONENT_SUMMARY=	Gnuplot is a portable command-line driven graphing utility
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:1f19596fd09045f22225afbfec11fa91b9ad1d95b9f48406362f517d4f130274
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# This is so that the 64bit gdlib-config gets picked up
#PATH.32 =       $(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
#PATH.64 =       $(USRDIR)/bin/$(MACH64):$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
#PATH    =       $(PATH.$(BITS))

LDFLAGS +=	-lm -llua -liconv

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

