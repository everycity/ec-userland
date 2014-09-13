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
COMPONENT_VERSION=	2.8.12.2
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.cmake.org/"
COMPONENT_SUMMARY=	CMake - A cross-platform, open-source make system.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
	sha256:8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e
COMPONENT_ARCHIVE_URL=	http://www.cmake.org/files/v2.8/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS += -lsocket -lnsl
LDFLAGS += -ltinfo

CONFIGURE_OPTIONS=	--prefix=$(USRDIR) --mandir=share/man
CONFIGURE_OPTIONS+=	--docdir=share/doc/cmake-2.8

CONFIGURE_OPTIONS +=	--system-curl
#CONFIGURE_OPTIONS=	--system-expat
CONFIGURE_OPTIONS +=	--system-zlib
CONFIGURE_OPTIONS +=	--system-bzip2
#CONFIGURE_OPTIONS +=	--verbose

build:		$(BUILD_32)

install:	$(INSTALL_32)
