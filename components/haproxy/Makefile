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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		haproxy
COMPONENT_FMRI=		web/loadbalancer/haproxy
COMPONENT_VERSION_MJR=	1.5
COMPONENT_VERSION_MNR=	10
COMPONENT_VERSION=	$(COMPONENT_VERSION_MJR).$(COMPONENT_VERSION_MNR)
COMPONENT_LICENSE=	HAPROXY
COMPONENT_PROJECT_URL=	"http://haproxy.1wt.eu/"
COMPONENT_SUMMARY=	A reliable, high performance TCP/HTTP load balancer
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:090264c834477c290f6ad6da558731d50aede0800996742d15e870b9947fe517
COMPONENT_ARCHIVE_URL=	http://haproxy.1wt.eu/download/$(COMPONENT_VERSION_MJR)/src/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_BUILD_ACTION+=	$(CLONEY) $(SOURCE_DIR) $(@D)

SBINDIR.32=	$(ECPREFIX)/bin
SBINDIR.64=	$(ECPREFIX)/bin/$(MACH64)

ifeq ($(SOLARIS_VERSION), 2.10)
COMPONENT_EXTRA_PATCH_ACTION=   ($(GPATCH) -d $(@D) $(GPATCH_FLAGS) < lcrypt_d.patch)
endif

COMPONENT_BUILD_ARGS+=		PREFIX=$(ECPREFIX)
COMPONENT_BUILD_ARGS+=		SBINDIR=$(SBINDIR.$(BITS))
COMPONENT_BUILD_ARGS+=		DOCDIR=$(ECPREFIX)/share/doc/haproxy
COMPONENT_BUILD_ARGS+=		TARGET=solaris
COMPONENT_BUILD_ARGS+=		USE_OPENSSL=1 USE_ZLIB=1 USE_PCRE=1 USE_REGPARM=1 PCRE_INC=$(ECPREFIX)/include
COMPONENT_BUILD_ARGS.32+=	ARCH=32 CPU=i686 PCRE_LIB=$(ECPREFIX)/lib
COMPONENT_BUILD_ARGS.64+=	ARCH=x86_64 PCRE_LIB=$(ECPREFIX)/lib/$(MACH64)
COMPONENT_BUILD_ARGS+=		$(COMPONENT_BUILD_ARGS.$(BITS))
COMPONENT_INSTALL_ARGS+=	$(COMPONENT_BUILD_ARGS)

COMPONENT_POST_INSTALL_ACTION.32+= ( cd $(@D)/contrib/halog && $(GMAKE) $(COMPONENT_BUILD_ARGS) && \
	cp halog $(PROTO_DIR)/$(SBINDIR.$(BITS)) )
COMPONENT_POST_INSTALL_ACTION+=	$(COMPONENT_POST_INSTALL_ACTION.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

