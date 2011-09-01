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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		cronolog
COMPONENT_VERSION=	1.6.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:6422b7c5e87241eb31d76809a2e0eea77ae4c64e
COMPONENT_ARCHIVE_URL=	http://cronolog.org/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS=	--prefix=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--mandir=$(ECPREFIX)/share/man
CONFIGURE_OPTIONS+=	--bindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS+=	--libdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS+=	--sbindir=$(ECPREFIX)/bin

build:		$(BUILD_32)

install:	$(INSTALL_32)
