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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		eventlog
SYSLOG_VERSION=		3.2.4
COMPONENT_VERSION=	0.2.12
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:c5bfe4bb3ba58413e96dac86c03c7fe73e899b44
COMPONENT_ARCHIVE_URL=	http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/$(SYSLOG_VERSION)/source/$(COMPONENT_ARCHIVE)


include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS += 	--enable-shared
CONFIGURE_OPTIONS += 	--disable-static

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

