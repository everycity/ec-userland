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
# Copyright 2019, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libffi
COMPONENT_FMRI=		library/libffi
COMPONENT_VERSION=	3.2.1
COMPONENT_LICENSE=	MIT
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=	http://sourceware.org/libffi/
COMPONENT_SUMMARY=	Foreign Function Interface Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37
COMPONENT_ARCHIVE_URL=	http://www.mirrorservice.org/sites/sources.redhat.com/pub/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--disable-static

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

