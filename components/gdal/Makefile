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

COMPONENT_NAME=		gdal
COMPONENT_FMRI=         library/gdal
COMPONENT_VERSION=      1.11.1
COMPONENT_LICENSE=      GDAL
COMPONENT_PROJECT_URL=  "http://www.gdal.org/"
COMPONENT_SUMMARY=	Geospatial Data Abstraction Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:20e1042cff15a71038459a299732fb342428aea9912f32df30c85790fcab6302
COMPONENT_ARCHIVE_URL=	http://download.osgeo.org/$(COMPONENT_NAME)/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

LDFLAGS.32 +=	-L$(ECPREFIX)/lib/postgres/9.3/lib -R$(ECPREFIX)/lib/postgres/9.3/lib
LDFLAGS.64 +=	-L$(ECPREFIX)/lib/postgres/9.3/lib/$(MACH64) -R$(ECPREFIX)/lib/postgres/9.3/lib/$(MACH64)

CONFIGURE_OPTIONS.32 +=	--with-pg=$(ECPREFIX)/lib/postgres/9.3/bin/pg_config
CONFIGURE_OPTIONS.64 +=	--with-pg=$(ECPREFIX)/lib/postgres/9.3/bin/$(MACH64)/pg_config

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

