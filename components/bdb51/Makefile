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

COMPONENT_NAME=		db
COMPONENT_VERSION=	5.1.25
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:1a216821957ce910a269bf9916bf49aba0f08b4d
COMPONENT_ARCHIVE_URL=	http://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/bdb/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_SCRIPT=	$(SOURCE_DIR)/dist/configure
COMPONENT_INSTALL_ARGS  += docdir=$(USRDIR)/share/doc/$(COMPONENT_NAME)-$(COMPONENT_VERSION)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
