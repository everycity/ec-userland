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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		asterisk
COMPONENT_FMRI=         telephony/asterisk
COMPONENT_VERSION=      11.11.0
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://www.asterisk.org/
COMPONENT_SUMMARY=	An open source telephony switching and private branch exchange service
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:568c9558005e686b020d596556c700ecec910a0c4f81fe54141851d049e222a6
COMPONENT_ARCHIVE_URL=	http://downloads.asterisk.org/pub/telephony/asterisk/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_BINDIR.64=   $(CONFIGURE_PREFIX)/bin
CONFIGURE_LIBDIR.64=   $(CONFIGURE_PREFIX)/lib
CONFIGURE_SBINDIR.64=  $(CONFIGURE_PREFIX)/bin

CONFIGURE_OPTIONS+=	--without-oss
CONFIGURE_OPTIONS+=	--without-postgres
CONFIGURE_OPTIONS+=	--build=x86_64-pc-solaris2.11

COMPONENT_PRE_CONFIGURE_ACTION=	$(CLONEY) $(SOURCE_DIR) $(@D)
CONFIGURE_ENV+=	CC="$(CC) -m64" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" CXXFLAGS="$(CFLAGS)"
COMPONENT_BUILD_ENV+= CC="$(CC) -m64" CXX="$(CCC)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"

PATH=$(ECPREFIX)/bin/$(MACH64):$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin
PKG_CONFIG_PATH= $(ECPREFIX)/lib/$(MACH64)/pkgconfig
PKG_CONFIG= $(ECPREFIX)/bin/$(MACH64)/pkg-config

build:		$(BUILD_64)

install:	$(INSTALL_64)

