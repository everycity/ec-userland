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
# Copyright 2013 EveryCity Ltd. All rights reserved.
# Copyright (c) 2011, 2013, Oracle and/or its affiliates. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tcsh
COMPONENT_FMRI=         shell/tcsh
COMPONENT_VERSION=      6.18.01
IPS_COMPONENT_VERSION=	6.18.1
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  http://www.tcsh.org/
COMPONENT_SUMMARY=	C shell with file name completion and command line editing
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d81ca27851f3e8545666399b4bcf25433e602a195113b3f7c73886fef84c9fa8
COMPONENT_ARCHIVE_URL=	ftp://ftp.astron.com/pub/tcsh/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = \
	($(CLONEY) $(SOURCE_DIR) $(@D))

COMPONENT_PREP_ACTION = \
	(cd $(@D) ; autoconf )
LOCALEDIR=$(PROTO_DIR)/$(CONFIGURE_LOCALEDIR)

LDFLAGS += -ltinfo

CONFIGURE_OPTIONS  +=		--localedir=$(CONFIGURE_LOCALEDIR)
CONFIGURE_OPTIONS  +=		CFLAGS="$(CFLAGS)"

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32)

install:	$(INSTALL_32)

