#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL)". You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libX11
COMPONENT_VERSION=	1.4.3
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:75fd6f6b3470792bdd37f42fe3bccfac835dfcca
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# This is so that the 64bit libgcrypt-config gets picked up
PATH.32=$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH.64=$(USRDIR)/bin/$(MACH64):$(USRDIR)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PATH=$(PATH.$(BITS))

CONFIGURE_OPTIONS +=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS +=	--with-sysroot=$(USRDIR)
CONFIGURE_OPTIONS +=	--with-xmlto=no

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

