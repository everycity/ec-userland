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

COMPONENT_MJR_VERSION=	9.6
COMPONENT_MNR_VERSION=	2
COMPONENT_ARCHIVE_HASH=	sha256:0187b5184be1c09034e74e44761505e52357248451b0c854dddec6c231fe50c9

PG_CONTRIB_LIBS+=	uuid-ossp

CONFIGURE_OPTIONS +=	--with-uuid=e2fs

include ../meta-packages/postgresql/Makefile.common
