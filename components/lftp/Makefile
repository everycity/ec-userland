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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lftp
COMPONENT_FMRI=         ftp/client/lftp
COMPONENT_VERSION=      4.6.4
COMPONENT_LICENSE=      GPLv3
COMPONENT_PROJECT_URL=  http://lftp.yar.ru/
COMPONENT_SUMMARY=	A sophisticated ftp/http client, and a file transfer program supporting a number of network protocols
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:791e783779d3d6b519d0c23155430b9785f2854023eb834c716f5ba78873b15a
COMPONENT_ARCHIVE_URL=	http://lftp.yar.ru/ftp/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

