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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		inetutils
COMPONENT_VERSION=	1.9.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:02a9ebde8a198cb85f87545b9d88fb103a183958139864a85fe9e027ad79ff2b
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# We only want the ping utility out of this bag of tricks

CONFIGURE_OPTIONS+= 	--disable-servers
CONFIGURE_OPTIONS+= 	--disable-clients
CONFIGURE_OPTIONS+= 	--enable-ping

build:		$(BUILD_32)

install:	$(INSTALL_32)

