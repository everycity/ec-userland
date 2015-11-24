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

COMPONENT_NAME=		slang
COMPONENT_FMRI=		library/slang
COMPONENT_VERSION=	2.2.4
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.jedsoft.org/slang/"
COMPONENT_SUMMARY=	S-Lang is a multi-platform library designed to allow a developer to create robust multi-platform software.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:9a8257a9a2a55099af858b13338dc8f3a06dd2069f46f0df2c9c3bb84a01d5db
COMPONENT_ARCHIVE_URL=	http://www.jedsoft.org/releases/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# make build isn't thread safe.
COMPONENT_BUILD_GMAKE_ARGS=

# configure the unpacked source for building 32 and 64 bit version
$(BUILD_DIR)/%/.configured:	$(SOURCE_DIR)/.prep
	mkdir -p $(@)
	cp -R $(SOURCE_DIR)/* $(@D)/
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CONFIG_SHELL) \
		./configure $(CONFIGURE_OPTIONS))
	$(TOUCH) $@
LDFLAGS+=	-lreadline

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))
CONFIGURE_SCRIPT =	$(@D)/configure

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

