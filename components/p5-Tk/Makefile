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

COMPONENT_NAME=		Tk
COMPONENT_VERSION=	804.031
IPS_COMPONENT_VERSION=	804.31
COMPONENT_SRC=		Tk-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
#COMPONENT_ARCHIVE_HASH=	sha256:8b3d55ae2e9ae950a170cd46399660064920d6d7c3ba167bca40e533d26e8d78
COMPONENT_ARCHIVE_URL=	http://ftp.heanet.ie/mirrors/ftp.perl.org/pub/CPAN/authors/id/S/SR/SREZIC/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk
include ../../make-rules/makemaker.mk

#CC += -m64

build:		$(BUILD_64)

install:	$(INSTALL_64)

