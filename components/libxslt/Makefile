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
# Copyright 2011 Audioboo Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libxslt
COMPONENT_VERSION=	1.1.26
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:69f74df8228b504a87e2b257c2d5238281c65154
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XMLSOFT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# This is so that the 64bit libgcrypt-config gets picked up
PATH.32=$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64=$(ECPREFIX)/bin/$(MACH64):$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH=$(PATH.$(BITS))

CONFIGURE_ENV +=	LIBS="$(LIBS) -lpython2.6"

CONFIGURE_OPTIONS +=	--enable-static=no

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

