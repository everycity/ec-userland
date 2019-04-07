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

COMPONENT_MJR_VERSION=	9.5
COMPONENT_MNR_VERSION=	16
COMPONENT_ARCHIVE_HASH=	sha256:a4576c95d4dcee8d4b7835b333d38e909848222e4b87895878bb1c026206e131

PG_CONTRIB_LIBS+=	uuid-ossp

CONFIGURE_OPTIONS +=	--with-uuid=e2fs

include ../meta-packages/postgresql/Makefile.common
