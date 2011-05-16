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

COMPONENT_NAME=		bind
COMPONENT_VERSION=	9.8.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:33019694ef3119d9daa1e8ff5117a6688e188528
COMPONENT_ARCHIVE_URL=	http://ftp.belnet.be/pub/mirror/ftp.isc.org/isc/bind9/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS += --disable-static --enable-shared --with-pic --with-openssl=$(ECPREFIX)
CONFIGURE_OPTIONS += --with-libxml2=$(ECPREFIX) --with-libtool=$(ECPREFIX) --with-libiconv=$(ECPREFIX)
CONFIGURE_OPTIONS.32 +=    --sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64 +=    --sbindir=$(ECPREFIX)/bin/$(MACH64)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

