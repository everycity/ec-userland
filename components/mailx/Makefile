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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

# This version of mailx is intended for use without an MTA so although
# it is hard-coded against exim, there is no dependency in the package
# manifest. Install exim manually if required.

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mailx
COMPONENT_VERSION=	12.5
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d7446ec2847a367b09aeedc2f38051f0ab1da846742160d2b21c78b74b8adb84
COMPONENT_ARCHIVE_URL=	http://dummy


include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

