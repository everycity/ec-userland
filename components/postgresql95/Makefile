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

COMPONENT_MJR_VERSION=	9.5
COMPONENT_MNR_VERSION=	6
COMPONENT_ARCHIVE_HASH=	sha256:bb9e5f6d34e20783e96e10c1d6c0c09c31749e802aaa46b793ce2522725ae12f

PG_CONTRIB_LIBS+=	uuid-ossp

CONFIGURE_OPTIONS +=	--with-uuid=e2fs

include ../meta-packages/postgresql/Makefile.common
