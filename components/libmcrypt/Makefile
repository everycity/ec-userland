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

COMPONENT_NAME=		libmcrypt
COMPONENT_VERSION=	2.5.8
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:9a426532e9087dd7737aabccff8b91abf9151a7a
COMPONENT_ARCHIVE_URL=	http://kent.dl.sourceforge.net/project/mcrypt/Libmcrypt/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION += cd $(SOURCE_DIR) ; rm -f Makefile config.guess config.h config.sub config.status ; ./buildconf ; cp -r $(SOURCE_DIR)/* $(@D)
CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

