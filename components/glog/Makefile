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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		glog
COMPONENT_FMRI=         library/glog
COMPONENT_VERSION=      0.3.3
COMPONENT_LICENSE=      3 Clause BSD
COMPONENT_PROJECT_URL=  "https://github.com/google/glog"
COMPONENT_SUMMARY=	C++ implementation of the Google logging module
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	v$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:544e178644bd9b454768c2c91716c3b8365cc5d47adfbdbaecd8cf3fa17adfcb
COMPONENT_ARCHIVE_URL=	https://github.com/google/glog/archive/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

