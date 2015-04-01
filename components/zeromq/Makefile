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

COMPONENT_NAME=		zeromq
COMPONENT_FMRI=         library/zeromq
COMPONENT_VERSION=      4.0.5
COMPONENT_LICENSE=      LGPL with static linking exception
COMPONENT_PROJECT_URL=  "http://zeromq.org/"
COMPONENT_SUMMARY=	ZeroMQ is a high-performance asynchronous messaging library aimed at use in scalable distributed or concurrent applications
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3bc93c5f67370341428364ce007d448f4bb58a0eaabd0a60697d8086bc43342b
COMPONENT_ARCHIVE_URL=	http://download.zeromq.org/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

