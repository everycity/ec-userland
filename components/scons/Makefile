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

COMPONENT_NAME=		scons
COMPONENT_FMRI=		developer/build/scons
COMPONENT_VERSION=	3.0.1
COMPONENT_LICENSE=	MIT
COMPONENT_LICENSE_FILE=	LICENSE.txt
COMPONENT_PROJECT_URL=	"http://www.scons.org/"
COMPONENT_SUMMARY=	SCons is an Open Source software construction tool
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:24475e38d39c19683bc88054524df018fe6949d70fbd4c69e298d39a0269f173
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/setup.py.mk
include ../../make-rules/ips.mk

PYTHON_VERSIONS = 2.7

build:		$(BUILD_32)

install:	$(INSTALL_32)

