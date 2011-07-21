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

COMPONENT_NAME=		nasm
COMPONENT_VERSION=	2.09.08
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:5d1b7a4b16e65dcbcb04e0b0735f1cd7a6a53a90
COMPONENT_ARCHIVE_URL=	http://www.nasm.us/pub/nasm/releasebuilds/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

COMPONENT_POST_CONFIGURE_ACTION += (mkdir -p $(BUILD_DIR_32)/lib $(BUILD_DIR_64)/lib)
CONFIGURE_OPTIONS.32 += CFLAGS="-I$(BUILD_DIR_32)"
CONFIGURE_OPTIONS.64 += CFLAGS="-I$(BUILD_DIR_64)"
COMPONENT_INSTALL_ENV += INSTALLROOT="$(PROTO_DIR)"

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

IPS_COMPONENT_VERSION=	2.9.8

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

