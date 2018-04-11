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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pcre
COMPONENT_FMRI=		library/pcre
COMPONENT_VERSION=	8.42
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	http://www.pcre.org/
COMPONENT_SUMMARY=	Perl-Compatible Regular Expressions
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:69acbc2fbdefb955d42a4c606dfde800c2885711d2979e356c0636efde9ec3b5
COMPONENT_ARCHIVE_URL=	ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS +=	--disable-static
CONFIGURE_OPTIONS +=	--enable-pcre16 --enable-pcre32
CONFIGURE_OPTIONS +=	--enable-utf --enable-unicode-properties
CONFIGURE_OPTIONS +=	--enable-jit

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
