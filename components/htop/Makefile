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

COMPONENT_NAME=		htop
COMPONENT_FMRI=		system/utility/htop
COMPONENT_VERSION=	1.0.2
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://hisham.hm/htop/"
COMPONENT_SUMMARY=	An interactive process viewer
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ee60657b044ece0df096c053060df7abf3cce3a568ab34d260049e6a37ccd8a1
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

ifeq ($(SOLARIS_VERSION), 2.10)
PUBLISH_STAMP=
endif

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = $(CLONEY) $(SOURCE_DIR) $(@D)

CONFIGURE_OPTIONS+= CPPFLAGS=-I$(ECPREFIX)/include/ncurses
CONFIGURE_OPTIONS+= --with-proc=/system/lxproc
CONFIGURE_OPTIONS+= --enable-unicode

build_2.10:
	@echo "Not available."
build_2.11:     $(BUILD_32)
build:          build_$(SOLARIS_VERSION)


install_2.10:
	@echo "Not available."
install_2.11:   $(INSTALL_32)
install:        install_$(SOLARIS_VERSION)

