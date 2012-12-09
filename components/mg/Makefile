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
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mg
COMPONENT_VERSION=	20110120
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:1f0f3eb31f72cbf92513339aa681e289a00d654b
COMPONENT_ARCHIVE_URL=	http://homepage.boetes.org/software/mg/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

ifeq ($(SOLARIS_VERSION),2.10)
COMPONENT_EXTRA_PATCH_ACTION=	($(GPATCH) -d $(@D) $(GPATCH_FLAGS) < fgetln-s10.patch)
endif

CONFIGURE_OPTIONS = 
COMPONENT_PRE_CONFIGURE_ACTION+= cp -R $(SOURCE_DIR)/* $(@D)/

# install the built source into a prototype area
$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin
	$(CP) $(@D)/mg $(PROTO_DIR)$(ECPREFIX)/bin/
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)

