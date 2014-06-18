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
# Copyright 2011-2013 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gzip
COMPONENT_FMRI=		compress/gnu-gzip
COMPONENT_VERSION=	1.5
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	http://www.gnu.org/software/gzip/
COMPONENT_SUMMARY=	The GNU Zip (gzip) compression utility
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b5d56e8ffc9918e8c941fab56e04121194f9870adeeb859e09c09eac264035a3
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

