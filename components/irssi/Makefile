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

COMPONENT_NAME=		irssi
COMPONENT_FMRI=		network/chat/irssi
COMPONENT_VERSION=	1.1.2
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"https://irssi.org/"
COMPONENT_SUMMARY=	Irssi is a terminal based IRC client for UNIX systems
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:db7d9ec271c13a28e28af9d72656f61849de88e2592cbb7530768da614697049
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GITHUB2)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-ncurses=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-perl-lib=$(ECPREFIX)/lib/perl/site_perl/5.12

build:		$(BUILD_32)

install:	$(INSTALL_32)

