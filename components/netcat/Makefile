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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		nc
COMPONENT_VERSION=	1.10
COMPONENT_VERSION_DOWNLOAD=	110
COMPONENT_SRC=		$(COMPONENT_NAME)$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(SF_PROJECT_NAME).tgz
COMPONENT_ARCHIVE_HASH=	sha256:5b3fda14e972d908896a605293f4634a72e2968278117410e12d8b3faf9a3976
SF_PROJECT_NAME=	nc110
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

UNPACK_ARGS=	-r $(COMPONENT_SRC)

COMPONENT_BUILD_ARGS=	solaris

# install the built source into a prototype area
$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)$(USRDIR)/bin
	$(CP) $(@D)/nc $(PROTO_DIR)$(USRDIR)/bin/
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)

