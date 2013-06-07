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

COMPONENT_NAME=		dspam
COMPONENT_FMRI=         security/antispam/dspam
COMPONENT_VERSION=      3.10.2
COMPONENT_LICENSE=      AGPLv3
COMPONENT_PROJECT_URL=  $(PROJECT_SOURCEFORGE2)
COMPONENT_SUMMARY=	DSPAM is a scalable and open-source content-based spam filter designed for multi-user enterprise systems.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ae76569604021f35b741fb95198a1e611a8c64c3838661973a6cf360bba593a9
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# Build not thread safe
override COMPONENT_BUILD_GMAKE_ARGS=

CONFIGURE_OPTIONS += --enable-debug
CONFIGURE_OPTIONS += --enable-clamav
CONFIGURE_OPTIONS += --enable-syslog
CONFIGURE_OPTIONS += --enable-daemon
CONFIGURE_OPTIONS += --disable-static

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

