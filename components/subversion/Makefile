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

COMPONENT_NAME=		subversion
COMPONENT_VERSION=	1.6.16
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
#COMPONENT_ARCHIVE_HASH=	sha1:1a059b3736ef908b68acac91670f9df576d1a061
COMPONENT_ARCHIVE_URL=	http://subversion.tigris.org/downloads/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS.32=		-L$(ECPREFIX)/lib -R$(ECPREFIX)/lib
LDFLAGS.64=		-L$(ECPREFIX)/lib/amd64 -R$(ECPREFIX)/lib/amd64
LDFLAGS+=		$(LDFLAGS.$(BITS))
LDFLAGS+=		-lintl -liconv

CONFIGURE_OPTIONS+=	LDFLAGS="$(LDFLAGS)"
CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--with-ssl=openssl
CONFIGURE_OPTIONS+=	--with-neon=/ec
CONFIGURE_OPTIONS+=	--disable-mod-activation
CONFIGURE_OPTIONS.32+=	--with-apr=/ec/bin/apr-1-config
CONFIGURE_OPTIONS.32+=	--with-apr-util=/ec/bin/apu-1-config
CONFIGURE_OPTIONS.64+=	--with-apr=/ec/bin/amd64/apr-1-config
CONFIGURE_OPTIONS.64+=	--with-apr-util=/ec/bin/amd64/apu-1-config
CONFIGURE_OPTIONS.32+=	--with-apxs=/ec/bin/apxs
CONFIGURE_OPTIONS.64+=	--with-apxs=/ec/bin/amd64/apxs
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))


build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


