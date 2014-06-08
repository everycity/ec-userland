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
# Copyright 2011-2014 EveryCity Ltd. All rights reserved.
#
CONFIGURE_DEFAULT_CPPFLAGS = yes
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mpc
COMPONENT_FMRI=		library/mpc
COMPONENT_VERSION=	1.0.1
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_PROJECT_URL=	http://www.multiprecision.org/
COMPONENT_SUMMARY=	A C library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ed5a815cfea525dc778df0cb37468b9c1b554aaf30d9328b1431ca705b7400ff
COMPONENT_ARCHIVE_URL=	http://www.multiprecision.org/mpc/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS += $(CPP_LARGEFILES)

CONFIGURE_OPTIONS  +=		--infodir=$(CONFIGURE_INFODIR)
CONFIGURE_OPTIONS  +=		--disable-static
CONFIGURE_OPTIONS  +=		--with-pic

# common targets
build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)	

test: install
		@cd $(BUILD_DIR_32)/tests; $(MAKE) check
		@cd $(BUILD_DIR_64)/tests; $(MAKE) check

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
