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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		dbt2
COMPONENT_FMRI=         benchmark/dbt2
COMPONENT_VERSION=      0.37.50.3
COMPONENT_LICENSE=      Artistic GPLv2
COMPONENT_PROJECT_URL=  http://dev.mysql.com/downloads/benchmarks.html
COMPONENT_SUMMARY=	The DBT2 Benchmark Tool can be used to run automated benchmarks for MySQL and MySQL Cluster
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e160ebab113594306ffd5d1b7b2c09fbd6d1731aa16916480b9d6656cf6fa681
# mysql.com is hopeless for this file so using cache
#COMPONENT_ARCHIVE_URL=	http://downloads.mysql.com/source/$(COMPONENT_ARCHIVE)
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_EC)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS+=		-I$(SOURCE_DIR)/src/include

CONFIGURE_OPTIONS+=	--with-mysql
CONFIGURE_OPTIONS+=	--program-prefix=dbt2-


build:		$(BUILD_32)

install:	$(INSTALL_32)

