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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		iperf
COMPONENT_FMRI=		benchmark/iperf
COMPONENT_VERSION=	3.7
COMPONENT_LICENSE=      BSD-3-Clause
COMPONENT_PROJECT_URL=  https://software.es.net/iperf/
COMPONENT_SUMMARY=	A tool for measuring maximum TCP and UDP bandwidth performance
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d846040224317caf2f75c843d309a950a7db23f9b44b94688ccbe557d6d1710c
COMPONENT_ARCHIVE_URL=	https://downloads.es.net/pub/iperf/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#LDFLAGS+=	-lm
#LDFLAGS+=-lsocket -lnsl

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32)

install:	$(INSTALL_32)

