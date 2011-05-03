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

COMPONENT_NAME=		tidy
COMPONENT_VERSION=	20091223
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)cvs
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION)cvs.orig.tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:76fb4887bc08628e3dd6a26e0ebe48cf2d14fa05
COMPONENT_ARCHIVE_URL=	http://ftp.de.debian.org/debian/pool/main/t/tidy/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--disable-static --enable-shared --with-pic

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

