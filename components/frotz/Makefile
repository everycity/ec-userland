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

COMPONENT_NAME=		frotz
VERSION_MAJOR=		2.43
VERSION_MINOR=		d
VERSION_MINOR_NUMERIC=	4
COMPONENT_VERSION=	$(VERSION_MAJOR)$(VERSION_MINOR)
IPS_COMPONENT_VERSION=	$(VERSION_MAJOR).$(VERSION_MINOR_NUMERIC)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c56a2f77f630db04ad968fc7c0b2114e3f855fdae8ce226e600f20dcba2c5985
COMPONENT_ARCHIVE_URL=	http://ftp.jaist.ac.jp/pub/sourceforge/f/project/fr/$(COMPONENT_NAME)/$(COMPONENT_NAME)/$(VERSION_MAJOR)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ARGS+= DESTDIR=$(PROTO_DIR) ECPREFIX=$(ECPREFIX)
COMPONENT_INSTALL_ARGS+=	$(COMPONENT_BUILD_ARGS)


build:		$(BUILD_32)

install:	$(INSTALL_32)

