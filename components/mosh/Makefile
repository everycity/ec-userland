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

COMPONENT_NAME=		mosh
COMPONENT_FMRI=         shell/mosh
COMPONENT_VERSION=      1.2.3
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  http://mosh.mit.edu/
COMPONENT_SUMMARY=	Remote terminal application
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:93f09fda77e57f05485a61f3ac679bf9f3f359a9b0b93c216ddd53cd124a768f
COMPONENT_ARCHIVE_URL=	https://github.com/downloads/keithw/mosh/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

