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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		postgis
COMPONENT_VERSION=	1.5.4
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:60facf2166e2c6b3dcf3f17feef4bc33fc8f5e9a
COMPONENT_ARCHIVE_URL=	http://www.postgis.org/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS.32+=	--with-pgconfig=$(ECPREFIX)/bin/pg_config
CONFIGURE_OPTIONS.32+=	--with-geosconfig=$(ECPREFIX)/bin/geos-config
CONFIGURE_OPTIONS.64+=	--with-pgconfig=$(ECPREFIX)/bin/$(MACH64)/pg_config
CONFIGURE_OPTIONS.64+=	--with-geosconfig=$(ECPREFIX)/bin/$(MACH64)/geos-config

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

