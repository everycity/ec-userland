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
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
# Copyright 2012, 2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		junit
COMPONENT_VERSION=	4.10
COMPONENT_PROJECT_URL=	$(PROJECT_SOURCEFORGE2)
COMPONENT_SRC=		$(COMPONENT_NAME)$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).zip
COMPONENT_ARCHIVE_HASH=	sha256:df92699adbdf0716c19e9daf30118c65b82229d644594308b2a040dafe06a1f5
COMPONENT_ARCHIVE_URL=  $(DOWNLOAD_SF)
COMPONENT_BUGDB=	utility/junit

include ../../make-rules/prep.mk
include ../../make-rules/ant.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ARGS 	+= -Ddist=$(PROTO_DIR)$(USRDIR)/share
COMPONENT_BUILD_ARGS    += -Djavadocdir=$(PROTO_DIR)$(USRDIR)/share
COMPONENT_BUILD_TARGETS += dist

# common targets
build:		$(BUILD_32)
	
install:	build	
		
test:		$(NO_TESTS)
		
BUILD_PKG_DEPENDENCIES =        $(BUILD_TOOLS)

include ../../make-rules/depend.mk
