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

COMPONENT_NAME=		icu
COMPONENT_FMRI=		library/icu
COMPONENT_VERSION=	64.2
COMPONENT_OTHER_VERSION=64_2
COMPONENT_LICENSE=	MIT
COMPONENT_LICENSE_FILE=	license.html
COMPONENT_PROJECT_URL=	"http://site.icu-project.org/"
COMPONENT_SUMMARY=	C/C++ and Java libraries providing Unicode and Globalization support for software applications.
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	icu4c-$(COMPONENT_OTHER_VERSION)-src.tgz
COMPONENT_ARCHIVE_HASH=	sha256:627d5d8478e6d96fc8c90fed4851239079a561a6a8b9e48b0892f24e82d31d6c
COMPONENT_ARCHIVE_URL=	http://download.icu-project.org/files/icu4c/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS+=	-std=c99
CXXFLAGS+=	-std=c++0x
LDFLAGS_32=	-m32 -L$(BUILD_DIR_32)/lib -L$(BUILD_DIR_32)/stubdata -L$(USRDIR)/lib -R$(USRDIR)/lib -lumem
LDFLAGS_64=	-m64 -L$(BUILD_DIR_64)/lib -L$(BUILD_DIR_64)/stubdata -L$(USRDIR)/lib/$(MACH64) -R$(USRDIR)/lib/$(MACH64) -lumem
LDFLAGS=	$(LDFLAGS_$(BITS))

INCPATH = -I$(SOURCE_DIR)/source/i18n -I$(SOURCE_DIR)/source/common

CC += $(INCPATH)
CXX += $(INCPATH)

CONFIGURE_SCRIPT= $(SOURCE_DIR)/source/configure

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

