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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		pymongo
COMPONENT_FMRI=         library/python/pymongo
COMPONENT_VERSION=      2.7.1
COMPONENT_LICENSE=      APLv2
COMPONENT_PROJECT_URL=  "http://github.com/mongodb/mongo-python-driver"
COMPONENT_SUMMARY=	Python driver for MongoDB
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:4810d302b8e132b99bfb6eeabcc71490cfc9d4064d84df593feb305121ed3535
COMPONENT_ARCHIVE_URL=	https://pypi.python.org/packages/source/p/pymongo/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/setup.py.mk
include ../../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

