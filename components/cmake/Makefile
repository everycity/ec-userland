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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		CMake
COMPONENT_FMRI=		developer/build/cmake
COMPONENT_VERSION=	3.14.3
COMPONENT_LICENSE=	BSD
COMPONENT_LICENSE_FILE=	Copyright.txt
COMPONENT_PROJECT_URL=	"http://www.cmake.org/"
COMPONENT_SUMMARY=	CMake - A cross-platform, open-source make system.
COMPONENT_SRC=		cmake-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:215d0b64e81307182b29b63e562edf30b3875b834efdad09b3fcb5a7d2f4b632
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GITHUB3)
GITHUB_PROJECT=		Kitware

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

EC_INCLUDE=

LDFLAGS += -lsocket -lnsl
LDFLAGS += -ltinfo

CONFIGURE_OPTIONS=	--prefix=$(USRDIR) --mandir=share/man
CONFIGURE_OPTIONS+=	--docdir=share/doc/cmake-$(COMPONENT_VERSION)
CONFIGURE_OPTIONS+=	--system-curl
CONFIGURE_OPTIONS+=	--system-expat
CONFIGURE_OPTIONS+=	--system-zlib
CONFIGURE_OPTIONS+=	--system-bzip2

$(BUILD_DIR)/.installed:	$(INSTALL_32)
	find $(PROTO_DIR)$(USRDIR) -name "*\ *" -exec rm {} \;
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
