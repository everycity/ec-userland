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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		epm
COMPONENT_FMRI=         developer/epm
COMPONENT_VERSION=      3.7
COMPONENT_VERHASH=	3ade8cfe7e59ca8e65052644fed9fca4
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://www.msweet.org/projects.php?Z2
COMPONENT_SUMMARY=	EPM is an open source UNIX software and file packaging program that generates distribution archives from a list of files
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_VERHASH)-$(COMPONENT_SRC)-source.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b3fc4c5445de6c9a801504a3ea3efb2d4ea9d5a622c9427e716736e7713ddb91
COMPONENT_ARCHIVE_URL=	https://ooo-extras.apache-extras.org.codespot.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

