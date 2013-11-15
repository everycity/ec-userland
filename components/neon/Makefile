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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		neon
COMPONENT_FMRI=		library/neon
COMPONENT_VERSION=	0.30.0
COMPONENT_LICENSE=	LGPLv3
COMPONENT_PROJECT_URL=	"http://webdav.org/neon/"
COMPONENT_SUMMARY=	neon is an HTTP and WebDAV client library, with a C interface.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:2962cfcb5d30f3272e3d2fa0e473434419770a3801afe3d46e5d1650787990c2
COMPONENT_ARCHIVE_URL=	http://www.webdav.org/neon/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_ENV +=	NEON_LIBS="-lintl"

CONFIGURE_OPTIONS+=	--with-ca-bundle=$(ECPREFIX)/etc/openssl/cabundle.pem
CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--with-ssl=openssl

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


