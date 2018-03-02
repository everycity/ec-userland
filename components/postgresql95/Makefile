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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#

COMPONENT_MJR_VERSION=	9.5
COMPONENT_MNR_VERSION=	12
COMPONENT_ARCHIVE_HASH=	sha256:02e86f5c66467731bbec18fde96e0daf38c13c9141d8e7d41be663ab6fa6f698

PG_CONTRIB_LIBS+=	uuid-ossp

CONFIGURE_OPTIONS +=	--with-uuid=e2fs

include ../meta-packages/postgresql/Makefile.common
