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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lftp
COMPONENT_FMRI=         ftp/client/lftp
COMPONENT_VERSION=      4.7.6
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  http://lftp.yar.ru/
COMPONENT_SUMMARY=	A sophisticated ftp/http client, and a file transfer program supporting a number of network protocols
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:2c8773993ec06f59d7a5734090e64ec37f106f98b250b8c476c55cc0b35aa75d
COMPONENT_ARCHIVE_URL=	http://lftp.tech/ftp/lftp-4.7.6.tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-readline=$(ECPREFIX)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

