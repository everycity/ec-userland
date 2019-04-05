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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pcre
COMPONENT_FMRI=		library/pcre
COMPONENT_VERSION=	8.43
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	http://www.pcre.org/
COMPONENT_SUMMARY=	Perl-Compatible Regular Expressions
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0b8e7465dc5e98c757cc3650a20a7843ee4c3edf50aaf60bb33fd879690d2c73
COMPONENT_ARCHIVE_URL=	https://ftp.pcre.org/pub/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS +=	--disable-static
CONFIGURE_OPTIONS +=	--enable-pcre16 --enable-pcre32
CONFIGURE_OPTIONS +=	--enable-utf --enable-unicode-properties
CONFIGURE_OPTIONS +=	--enable-jit

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
