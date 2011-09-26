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

COMPONENT_NAME=		sudo
COMPONENT_VERSION=	1.8.1p2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:b743b3d7bdb06de68ea24eedfe13530e8fbcae09
COMPONENT_ARCHIVE_URL=	http://www.sudo.ws/sudo/dist/$(COMPONENT_ARCHIVE)

IPS_COMPONENT_VERSION=	1.8.1.2

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-insults
CONFIGURE_OPTIONS+=	--with-hal-insults
CONFIGURE_OPTIONS+=	--with-editor=/ec/bin/vim
CONFIGURE_OPTIONS+=	--exec-prefix=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-timedir=$(ECPREFIX)/var/adm/sudo
CONFIGURE_OPTIONS.32+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64+=	--sbindir=$(ECPREFIX)/bin/$(MACH64)

COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -R $(SOURCE_DIR)/* $(@D)/

build:		$(BUILD_32)

install:	$(INSTALL_32)

