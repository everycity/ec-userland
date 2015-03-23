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

COMPONENT_NAME=		postgis
COMPONENT_FMRI=		database/postgresql-91/postgis
COMPONENT_VERSION=	2.1.6
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.postgis.org/"
COMPONENT_SUMMARY=	PostGIS adds support for geographic objects to the PostgreSQL object-relational database.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6ffdf655bc4fca2b5495dd96f44b266e84111912d5c3f91b832023c4fec5c222
COMPONENT_ARCHIVE_URL=	http://download.osgeo.org/postgis/source/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS +=	-std=c99 -D__EXTENSIONS__

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS.32+=	--with-pgconfig=$(ECPREFIX)/lib/postgres/9.1/bin/pg_config
CONFIGURE_OPTIONS.32+=	--with-geosconfig=$(ECPREFIX)/bin/geos-config
CONFIGURE_OPTIONS.64+=	--with-pgconfig=$(ECPREFIX)/lib/postgres/9.1/bin/$(MACH64)/pg_config
CONFIGURE_OPTIONS.64+=	--with-geosconfig=$(ECPREFIX)/bin/$(MACH64)/geos-config

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

