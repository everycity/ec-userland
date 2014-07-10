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
COMPONENT_VERSION=	1.9.2
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	http://git-scm.com/
COMPONENT_SUMMARY=	git - Fast version control system
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d0dceb2e881f6a8f6eada128f782904b8711ea93a4c86dd38da99a7773edc25b
COMPONENT_ARCHIVE_URL=	https://www.kernel.org/pub/software/scm/git/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS+=	--libexecdir=$(USRDIR)/lib
CONFIGURE_OPTIONS+=	--with-gitconfig=$(CONFIGURE_SYSCONFDIR)/gitconfig
CONFIGURE_OPTIONS+=	--with-gitattributes=$(CONFIGURE_SYSCONFDIR)/gitattributes
CONFIGURE_OPTIONS+=	--with-python=$(PYTHON)
CONFIGURE_OPTIONS+=	--with-perl=$(USRDIR)/bin/perl
CONFIGURE_OPTIONS+=	--with-iconv=$(USRDIR)/lib
CONFIGURE_OPTIONS+=	--with-editor=vim

COMPONENT_BUILD_ENV+=		PERL_PATH=$(USRDIR)/bin/perl
COMPONENT_BUILD_TARGETS+=	all man
COMPONENT_INSTALL_TARGETS+=	install-man

build:		$(BUILD_32)

install:	$(INSTALL_32)
