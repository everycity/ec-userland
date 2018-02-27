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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		trafficserver
COMPONENT_FMRI=         web/loadbalancer/apachetrafficserver
COMPONENT_VERSION=      7.1.2
COMPONENT_LICENSE=      APLv2
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=  "http://trafficserver.apache.org/"
COMPONENT_SUMMARY=	Apache Traffic Server software is a fast, scalable and extensible HTTP/1.1 compliant caching proxy server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:413e7d5b2aee71c4403a00203d91b99544eecd1e36e47153240d24c0e4dad375
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

CONFIGURE_OPTIONS+=	--with-event-interface=port

build:		$(BUILD_64)

install:	$(INSTALL_64)

