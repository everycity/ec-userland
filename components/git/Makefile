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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		git
COMPONENT_FMRI=		developer/versioning/git
COMPONENT_VERSION=	1.9.1
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	http://git-scm.com/
COMPONENT_SUMMARY=	git - Fast version control system
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d57f3b6448eab0eb62fe3523ff36a8043aa42593f1ebb86324601aaa2217870d
COMPONENT_ARCHIVE_URL=	https://www.kernel.org/pub/software/scm/git/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS+=	--libexecdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS+=	--with-gitconfig=$(ECPREFIX)/etc/gitconfig
CONFIGURE_OPTIONS+=	--with-gitattributes=$(ECPREFIX)/etc/gitattributes
CONFIGURE_OPTIONS+=	--with-python=$(ECPREFIX)/bin/python2.6
CONFIGURE_OPTIONS+=	--with-perl=$(ECPREFIX)/bin/perl
CONFIGURE_OPTIONS+=	--with-iconv=$(ECPREFIX)/lib
CONFIGURE_OPTIONS+=	--with-editor=vim

LDFLAGS+=	-lintl

COMPONENT_BUILD_ENV+=		PERL_PATH=$(ECPREFIX)/bin/perl
COMPONENT_BUILD_TARGETS+=	all man
COMPONENT_INSTALL_TARGETS+=	install-man

build:		$(BUILD_32)

install:	$(INSTALL_32)
