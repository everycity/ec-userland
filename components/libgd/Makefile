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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libgd
COMPONENT_FMRI=		library/libgd
COMPONENT_VERSION=	2.1.0
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://libgd.bitbucket.org/"
COMPONENT_SUMMARY=	GD is an open source code library for the dynamic creation of images by programmers.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3ceef69d5454a392e8793ae90b5f0d632dd3e20879c12856aa1d1d3d063a51c8
COMPONENT_ARCHIVE_URL=	https://bitbucket.org/libgd/gd-libgd/downloads/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

