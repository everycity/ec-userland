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

COMPONENT_NAME=			gdb
COMPONENT_VERSION=		7.2
COMPONENT_ARCHIVE_VERSION=	7.2a
COMPONENT_SRC=			$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=		$(COMPONENT_NAME)-$(COMPONENT_ARCHIVE_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=		sha1:14daf8ccf1307f148f80c8db17f8e43f545c2691
COMPONENT_ARCHIVE_URL=		http://ftp.gnu.org/gnu/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

IPS_COMPONENT_VERSION=	7.2.1

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)
