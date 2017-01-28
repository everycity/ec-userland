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

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		epm
COMPONENT_FMRI=         developer/epm
COMPONENT_VERSION=      4.3
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://www.msweet.org/projects.php?Z2
COMPONENT_SUMMARY=	EPM is an open source UNIX software and file packaging program that generates distribution archives from a list of files
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-source.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:f1e5de1c1880adc4dcbead740f88463ba73c3ecc2419b261e0b8b685a5f3c352
COMPONENT_ARCHIVE_URL=	https://www.msweet.org/files/project2/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
