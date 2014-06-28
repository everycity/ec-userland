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

COMPONENT_NAME=		cmake
COMPONENT_FMRI=		developer/build/cmake
COMPONENT_VERSION=	2.8.12
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.cmake.org/"
COMPONENT_SUMMARY=	CMake - A cross-platform, open-source make system.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d885ba10b2406ede59aa31a928df33c9d67fc01433202f7dd586999cfd0e0287
COMPONENT_ARCHIVE_URL=	http://www.cmake.org/files/v2.8/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-lsocket -lnsl -ltinfo

CONFIGURE_OPTIONS=	--prefix=$(USRDIR) --mandir=share/man
CONFIGURE_OPTIONS+=	--docdir=share/doc/cmake-2.8

build:		$(BUILD_32)

install:	$(INSTALL_32)
