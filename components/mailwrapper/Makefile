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

COMPONENT_NAME=		mailwrapper-opencsw
COMPONENT_VERSION=	1.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH= \
    sha256:541d81c76fef33b1d33076f0089e66abe8e1a4de2293acbe0cc6a7255ae2c77d
COMPONENT_ARCHIVE_URL=	http://sk.freebsd.org/pub/local/distfiles/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ENV += CC=$(CC) PREFIX=$(ECPREFIX)
COMPONENT_INSTALL_ENV += DESTDIR=$(PROTO_DIR) ECPREFIX=$(ECPREFIX)

build:		$(BUILD_32)

install:	$(INSTALL_32)
