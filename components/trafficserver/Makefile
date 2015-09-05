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

COMPONENT_NAME=		trafficserver
COMPONENT_FMRI=         web/loadbalancer/apachetrafficserver
COMPONENT_VERSION=      5.1.2
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  "http://trafficserver.apache.org/"
COMPONENT_SUMMARY=	Apache Traffic Server software is a fast, scalable and extensible HTTP/1.1 compliant caching proxy server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:65102a7181c8f3b8fb893cb32de0f54818cefb40592a21f517082bdceb26ddcd
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

BITS = 64

CFLAGS+=	-I$(USRDIR)/include/libxml2
CFLAGS+=	-I$(USRDIR)/include/ncursesw
CXXFLAGS+=	-I$(USRDIR)/include/libxml2
CXXFLAGS+=	-I$(USRDIR)/include/ncursesw
CXXFLAGS+=	-std=gnu++11

LDFLAGS += -ltinfo

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_64)

install:	$(INSTALL_64)

