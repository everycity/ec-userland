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
# Copyright 2021 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pgbouncer
COMPONENT_FMRI=         database/pgbouncer
COMPONENT_VERSION=      1.15.0
COMPONENT_LICENSE=      ISC
COMPONENT_PROJECT_URL=  "https://www.pgbouncer.org/"
COMPONENT_SUMMARY=	Lightweight connection pooler for PostgreSQL
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e05a9e158aa6256f60aacbcd9125d3109155c1001a1d1c15d33a37c685d31380
COMPONENT_ARCHIVE_URL=	https://www.pgbouncer.org/downloads/files/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_POST_INSTALL_ACTION+= mkdir -p $(PROTO_DIR)$(ECPREFIX)/etc/pgbouncer ; \
	mkdir -p $(PROTO_DIR)$(ECPREFIX)/var/postgres/pgbouncer ; \
	mkdir -p $(PROTO_DIR)/var/svc/manifest/site ; \
	cp $(COMPONENT_DIR)/files/pgbouncer.ini $(PROTO_DIR)$(ECPREFIX)/etc/pgbouncer/pgbouncer.ini ; \
	cp $(COMPONENT_DIR)/files/pgbouncer-manifest.xml $(PROTO_DIR)/var/svc/manifest/site/ec-pgbouncer.xml

build:		$(BUILD_64)

install:	$(INSTALL_64)

