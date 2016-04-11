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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lftp
COMPONENT_FMRI=         ftp/client/lftp
COMPONENT_VERSION=      4.7.1
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  http://lftp.yar.ru/
COMPONENT_SUMMARY=	A sophisticated ftp/http client, and a file transfer program supporting a number of network protocols
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:98335d6f006286b3900cacf215f6341777f921ba2d412fa88b16727954daee58
COMPONENT_ARCHIVE_URL=	http://lftp.yar.ru/ftp/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-readline=$(ECPREFIX)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

