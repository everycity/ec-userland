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
# Copyright 2012, 2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		fping
COMPONENT_VERSION=	3.4
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d42528af4931f16a8e3438bd4a45cfdd72163ad8835a3c95351c336a26e56afe
COMPONENT_ARCHIVE_URL=	http://fping.org/dist/$(COMPONENT_ARCHIVE)

ifeq ($(SOLARIS_VERSION), 2.10)
PUBLISH_STAMP=
endif

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-ipv4
CONFIGURE_OPTIONS+=	--enable-ipv6

build_2.10:
	@echo "Not available."

build_2.11:	$(BUILD_32)

build:		build_$(SOLARIS_VERSION)


install_2.10:
	@echo "Not available."

install_2.11:	$(INSTALL_32)

install:	install_$(SOLARIS_VERSION)      

