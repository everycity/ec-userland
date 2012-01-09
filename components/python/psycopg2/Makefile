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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		psycopg2
COMPONENT_VERSION=	2.4.4
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:1f0a26588f1cf03b9aea028e0177cf3b7ef78e60
COMPONENT_ARCHIVE_URL=	http://initd.org/psycopg/tarballs/PSYCOPG-2-4/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/setup.py.mk
include ../../../make-rules/ips.mk

PYTHON_PRE_SETUP_ARGS.64 =	build_ext --pg-config $(ECPREFIX)/bin/$(MACH64)/pg_config
PYTHON_PRE_SETUP_ARGS =		$(PYTHON_PRE_SETUP_ARGS.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

