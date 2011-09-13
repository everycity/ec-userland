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

COMPONENT_NAME=			texinfo
COMPONENT_VERSION=		4.13
COMPONENT_ARCHIVE_VERSION=	4.13a
COMPONENT_SRC=			$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=		$(COMPONENT_NAME)-$(COMPONENT_ARCHIVE_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=		sha1:a1533cf8e03ea4fa6c443b73f4c85e4da04dead0
COMPONENT_ARCHIVE_URL=		http://ftp.gnu.org/gnu/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

COMPONENT_IPS_VERSION=	4.13.1

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

