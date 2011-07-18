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
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		faac
COMPONENT_VERSION=	1.28
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:d00b023a3642f81bb1fb13d962a65079121396ee
COMPONENT_ARCHIVE_URL=	http://downloads.sourceforge.net/project/$(COMPONENT_NAME)/faac-src/$(COMPONENT_SRC)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_SCRIPT=	./configure
COMPONENT_PRE_CONFIGURE_ACTION+=	( cp -r $(SOURCE_DIR)/* $(@D) && \
	cd $(@D) && libtoolize --force --copy  && aclocal && autoconf && automake )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

