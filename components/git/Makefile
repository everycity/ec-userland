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
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2011,2012 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		git
COMPONENT_VERSION=	1.8.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ccc32f18ea12ea730a7d1d9d3d7bf51447439299a99d4d326f49f1f8bb488974
COMPONENT_ARCHIVE_URL=	http://git-core.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS+=	--libexecdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS+=	--with-gitconfig=$(ECPREFIX)/etc/gitconfig
CONFIGURE_OPTIONS+=	--with-gitattributes=$(ECPREFIX)/etc/gitattributes
CONFIGURE_OPTIONS+=	--with-python=$(ECPREFIX)/bin/python2.6
CONFIGURE_OPTIONS+=	--with-perl=$(ECPREFIX)/bin/perl
CONFIGURE_OPTIONS+=	--with-editor=vim

LDFLAGS+=	-lintl

COMPONENT_BUILD_ENV+=	PERL_PATH=$(ECPREFIX)/bin/perl

build:		$(BUILD_32)

install:	$(INSTALL_32)
