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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

# Note this package doesn't work in Solaris 10 Zones with 
# a shared IP stack.

COMPONENT_NAME=		mtr
COMPONENT_VERSION=	0.85
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
#COMPONENT_ARCHIVE_HASH=	sha256:
COMPONENT_ARCHIVE_URL=	 ftp://ftp.bitwizard.nl/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	LIBS="-L$(ECPREFIX)/lib -lncurses"
CONFIGURE_OPTIONS+=	--without-gtk

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) && ./bootstrap.sh )

build:		$(BUILD_32)

install:	$(INSTALL_32)

