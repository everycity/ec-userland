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

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		wget
COMPONENT_FMRI=		web/gnu-wget
COMPONENT_VERSION=	1.19.5
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/wget/"
COMPONENT_SUMMARY=	GNU wget
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b39212abe1a73f2b28f4c6cb223c738559caac91d6e416a6d91d4b9d55c9faee
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS += 	--with-ssl
CONFIGURE_OPTIONS +=	--with-ssl=openssl

build:		$(BUILD_32)

install:	$(INSTALL_32)

