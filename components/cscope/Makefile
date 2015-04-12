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

COMPONENT_NAME=		cscope
COMPONENT_FMRI=         developer/cscope
COMPONENT_VERSION=      15.8a
IPS_COMPONENT_VERSION=	15.8.1
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  "http://cscope.sourceforge.net/"
COMPONENT_SUMMARY=	Cscope is a tool for browsing source code.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:eb736ac40d5abebe8fa46820c7a8eccc8a17966a9a5f70375367b77177874d1e
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS+=	-I/ec/include/ncurses
CONFIGURE_ENV+=	LIBS=-ltinfo

CONFIGURE_OPTIONS+=	--with-ncurses=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

