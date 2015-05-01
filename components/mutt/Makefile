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

COMPONENT_NAME=		mutt
COMPONENT_FMRI=		mail/mutt
COMPONENT_VERSION=	1.5.23
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.mutt.org/"
COMPONENT_SUMMARY=	Mutt is a small but very powerful text-based mail client for Unix operating systems
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3af0701e57b9e1880ed3a0dee34498a228939e854a16cdccd24e5e502626fd37
#COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)
COMPONENT_ARCHIVE_URL=	ftp://ftp.mutt.org/mutt/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS += -ltinfo

CONFIGURE_OPTIONS += 	--enable-pop --enable-imap --enable-smtp --enable-hcache
CONFIGURE_OPTIONS +=	--with-curses --with-gss --with-sasl --with-ssl --with-idn=$(USRDIR)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

