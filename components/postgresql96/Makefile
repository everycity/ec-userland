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

COMPONENT_MJR_VERSION=	9.6
COMPONENT_MNR_VERSION=	12
COMPONENT_ARCHIVE_HASH=	sha256:2e8c8446ba94767bda8a26cf5a2152bf0ae68a86aaebf894132a763084579d84

PG_CONTRIB_LIBS+=	uuid-ossp

CONFIGURE_OPTIONS +=	--with-uuid=e2fs

include ../meta-packages/postgresql/Makefile.common
