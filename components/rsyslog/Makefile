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

COMPONENT_NAME=		rsyslog
COMPONENT_VERSION=	7.2.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ba0aee5cd2c60192ca1f026817767aa66056c7f0fa78eb5b15b9394734e68e3f
COMPONENT_ARCHIVE_URL=	http://www.rsyslog.com/files/download/rsyslog/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-mail
CONFIGURE_OPTIONS+=	--enable-usertools
CONFIGURE_OPTIONS+=	--enable-imsolaris
CONFIGURE_OPTIONS+=	--enable-imfile
CONFIGURE_OPTIONS+=	--enable-impstats
CONFIGURE_OPTIONS+=	--enable-pmlastmsg
CONFIGURE_OPTIONS+=	--enable-pmsnare
CONFIGURE_OPTIONS+=	--enable-omuxsock
CONFIGURE_OPTIONS+=	--disable-testbench

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

