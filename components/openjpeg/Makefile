#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openjpeg
COMPONENT_VERSION=	1_4
COMPONENT_SRC=		$(COMPONENT_NAME)_v$(COMPONENT_VERSION)_sources_r697
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha1:9ef6a08ecf5944962b4e2cd7569ac01a8eaa66d0
COMPONENT_ARCHIVE_URL=	http://openjpeg.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=1.4.697

COMPONENT_PRE_CONFIGURE_ACTION+= cp -R $(SOURCE_DIR)/* $(@D)/

build:	$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


