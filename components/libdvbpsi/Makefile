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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libdvbpsi
COMPONENT_VERSION=	0.2.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:569bad6d4843ae2097501d5e66587578449e66fe18dec808437c2bed7c3be3ce
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_VIDEOLAN)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS	+=	-lnsl -lsocket -lresolv

CONFIGURE_OPTIONS+=	--with-pic --enable-shared --disable-static

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

