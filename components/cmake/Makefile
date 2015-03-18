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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		cmake
COMPONENT_FMRI=		developer/build/cmake
COMPONENT_VERSION_MJR=	3.2
COMPONENT_VERSION=	$(COMPONENT_VERSION_MJR).1
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.cmake.org/"
COMPONENT_SUMMARY=	CMake - A cross-platform, open-source make system.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:759f1cf6b1a26b037726a9acca6da501235c20ad3671df29d43f29052ef1502c
COMPONENT_ARCHIVE_URL=	http://www.cmake.org/files/v$(COMPONENT_VERSION_MJR)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-lsocket -lnsl

CONFIGURE_OPTIONS=	--prefix=$(ECPREFIX) --mandir=share/man
CONFIGURE_OPTIONS+=	--docdir=share/doc/cmake-$(COMPONENT_VERSION_MJR)

build:		$(BUILD_32)

$(BUILD_DIR)/.installed:	$(INSTALL_32)
	find $(PROTO_DIR)$(ECPREFIX) -name "*\ *" -exec rm {} \;
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
