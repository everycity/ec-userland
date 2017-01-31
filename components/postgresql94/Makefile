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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

COMPONENT_MJR_VERSION=	9.4
COMPONENT_MNR_VERSION=	10
COMPONENT_ARCHIVE_HASH=	sha256:7061678bed1981c681ce54c76b98b6ec17743f090a9775104a45e7e1a8826ecf

PG_CONTRIB_BINS+=	pgbench
PG_CONTRIB_LIBS+=	uuid-ossp

CONFIGURE_OPTIONS+=	--with-uuid=e2fs

include ../meta-packages/postgresql/Makefile.common
