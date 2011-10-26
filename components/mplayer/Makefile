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

COMPONENT_NAME=		mplayer
COMPONENT_VERSION=	2011-07-11
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:114a2d718dc15c3c32b6d8d8856e3ba9fbd45acf
COMPONENT_ARCHIVE_URL=	http://svn.everycity.co.uk/public/solaris/misc/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk
include ../../make-rules/gnu-ld.mk

IPS_COMPONENT_VERSION=	2011.7.11

CONFIGURE_ENV =

CONFIGURE_OPTIONS=	--prefix=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--mandir=$(ECPREFIX)/share/man
CONFIGURE_OPTIONS.32=	--bindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.32+=	--libdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS.64=	--bindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.64+=	--libdir=$(ECPREFIX)/lib/$(MACH64)

CONFIGURE_OPTIONS.64+=	--cc="$(ECPREFIX)/bin/gcc -m64"
CONFIGURE_OPTIONS.64+=	--as=$(ECPREFIX)/bin/$(MACH64)/as
CONFIGURE_OPTIONS.64+=	--extra-ldflags="-m64 -L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64)"
CONFIGURE_OPTIONS+=	--disable-live

CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -R $(SOURCE_DIR)/* $(@D)/
COMPONENT_POST_CONFIGURE_ACTION+=	(cd $(@D)/ && \
	$(ECPREFIX)/bin/sed -i 's/^\#endif \/\* MPLAYER_CONFIG_H .*//g' config.h ; \
	echo "\#ifndef alloca" >> config.h ; \
	echo "\#define alloca(x) __builtin_alloca(x)" >> config.h ; \
	echo "\#endif" >> config.h ; \
	echo "\#endif /* MPLAYER_CONFIG_H */" >> config.h )

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

