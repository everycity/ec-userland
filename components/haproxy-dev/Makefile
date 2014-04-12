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
# Copyright 2012-2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		haproxy
COMPONENT_PROJECT_URL=	http://haproxy.1wt.eu/
COMPONENT_FMRI=		web/loadbalancer/haproxy-dev
COMPONENT_VERSION=	1.5-dev22
IPS_COMPONENT_VERSION=	1.5.0.22
COMPONENT_LICENSE=	GPL/LGPL with OpenSSL exception
COMPONENT_SUMMARY=	A reliable, high performance TCP/HTTP load balancer
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b0978b4802a48ee60ca79c01c0b020c5155ac8248af65d24a248ace91b87ac2e
#COMPONENT_ARCHIVE_URL=	http://haproxy.1wt.eu/download/1.5/src/devel/${COMPONENT_ARCHIVE}
COMPONENT_ARCHIVE_URL=	http://download.openpkg.org/components/cache/haproxy/${COMPONENT_ARCHIVE}

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION+=	$(CLONEY) $(SOURCE_DIR) $(@D)

SBINDIR.32=	$(ECPREFIX)/bin
SBINDIR.64=	$(ECPREFIX)/bin/$(MACH64)

COMPONENT_BUILD_ARGS+=		PREFIX=$(ECPREFIX)
COMPONENT_BUILD_ARGS+=		SBINDIR=$(SBINDIR.$(BITS))
COMPONENT_BUILD_ARGS+=		DOCDIR=$(ECPREFIX)/share/doc/haproxy
COMPONENT_BUILD_ARGS+=		TARGET=solaris
COMPONENT_BUILD_ARGS+=		USE_OPENSSL=1 USE_ZLIB=1 USE_PCRE=1 USE_REGPARM=1
COMPONENT_BUILD_ARGS.32+=	ARCH=32
COMPONENT_BUILD_ARGS.64+=	ARCH=x86_64
COMPONENT_BUILD_ARGS+=		$(COMPONENT_BUILD_ARGS.$(BITS))
COMPONENT_INSTALL_ARGS+=	$(COMPONENT_BUILD_ARGS)

COMPONENT_POST_INSTALL_ACTION.32+= ( cd $(@D)/contrib/halog && $(GMAKE) $(COMPONENT_BUILD_ARGS) && \
    cp halog $(PROTO_DIR)/$(SBINDIR.$(BITS)) )
COMPONENT_POST_INSTALL_ACTION+=	$(COMPONENT_POST_INSTALL_ACTION.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

