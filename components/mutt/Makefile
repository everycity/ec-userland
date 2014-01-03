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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mutt
COMPONENT_FMRI=		mail/mutt
COMPONENT_VERSION=	1.5.22
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.mutt.org/"
COMPONENT_SUMMARY=	Mutt is a small but very powerful text-based mail client for Unix operating systems
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8feae890ed0758a5108bafaef27bd8fc9c378675acf25a3c620f2c7b7540f3a7
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS += 	--enable-pop --enable-imap --enable-smtp --enable-hcache
CONFIGURE_OPTIONS +=	--with-curses --with-gss --with-sasl --with-ssl --with-idn=$(ECPREFIX)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

