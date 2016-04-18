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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		psycopg2
COMPONENT_FMRI=		library/python/psycopg2-pg95
COMPONENT_VERSION=	2.6.1
COMPONENT_LICENSE=	GPL with exceptions or ZPL
COMPONENT_PROJECT_URL=	"http://initd.org/psycopg/"
COMPONENT_SUMMARY=	Python-PostgreSQL Database Adapter (PG 9.5)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6acf9abbbe757ef75dc2ecd9d91ba749547941abaffbe69ff2086a9e37d4904c
COMPONENT_ARCHIVE_URL=	http://initd.org/psycopg/tarballs/PSYCOPG-2-6/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/setup.py.mk
include ../../../make-rules/ips.mk

LDFLAGS.32+=	-L$(ECPREFIX)/lib/postgres/9.5/lib -R$(ECPREFIX)/lib/postgres/9.5/lib
LDFLAGS.64+=	-L$(ECPREFIX)/lib/postgres/9.5/lib/$(MACH64) -R$(ECPREFIX)/lib/postgres/9.5/lib/$(MACH64)

PYTHON_PRE_SETUP_ARGS.32 =	build_ext --pg-config $(ECPREFIX)/lib/postgres/9.5/bin/pg_config
PYTHON_PRE_SETUP_ARGS.64 =	build_ext --pg-config $(ECPREFIX)/lib/postgres/9.5/bin/$(MACH64)/pg_config
PYTHON_PRE_SETUP_ARGS =		$(PYTHON_PRE_SETUP_ARGS.$(BITS))

build:		$(BUILD_64)

install:	$(INSTALL_64)

