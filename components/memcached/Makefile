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

COMPONENT_NAME=		memcached
COMPONENT_FMRI=		database/memcached
COMPONENT_VERSION=	1.5.20
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://memcached.org/"
COMPONENT_SUMMARY=	The memcached memory object cache
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:cfd7b023a9cefe7ae8a67184f51d841dbbf97994ed0e8a55e31ee092320ea1e4
COMPONENT_ARCHIVE_URL=	http://www.memcached.org/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--enable-dtrace

COMPONENT_PRE_CONFIGURE_ACTION=	$(CLONEY) $(SOURCE_DIR) $(@D)

COMPONENT_POST_INSTALL_ACTION+= mkdir -p $(PROTO_DIR)$(ECPREFIX)/var/svc/method ; \
        mkdir -p $(PROTO_DIR)/var/svc/manifest/site ; \
        cp $(COMPONENT_DIR)/memcached-startup.sh $(PROTO_DIR)$(ECPREFIX)/var/svc/method/memcached.sh ; \
        cp $(COMPONENT_DIR)/memcached-manifest.xml $(PROTO_DIR)/var/svc/manifest/site/ec-memcached.xml

build:		$(BUILD_64)

include ../../make-rules/shared-targets.mk

install:	$(INSTALL_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
