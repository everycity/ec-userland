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

COMPONENT_NAME=		wavpack
COMPONENT_VERSION=	4.60.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
#COMPONENT_ARCHIVE_HASH=	sha1:
COMPONENT_ARCHIVE_URL=	http://www.wavpack.com/wavpack-4.60.1.tar.bz2

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-pic --enable-shared --disable-static
CONFIGURE_OPTIONS+=	--with-iconv=$(ECPREFIX)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

