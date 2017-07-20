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

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		bcrypt
COMPONENT_FMRI=         library/python-2/bcrypt
COMPONENT_VERSION=      3.1.3
COMPONENT_LICENSE=      Apachev2
COMPONENT_PROJECT_URL=  "https://github.com/pyca/pynacl/"
COMPONENT_SUMMARY=	Python binding to the Networking and Cryptography (NaCl) library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6645c8d0ad845308de3eb9be98b6fd22a46ec5412bfc664a423e411cdd8f5488
COMPONENT_ARCHIVE_URL=	https://pypi.python.org/packages/58/e9/6d7f1d883d8c5876470b5d187d72c04f2a9954d61e71e7eb5d2ea2a50442/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/setup.py.mk
include ../../../make-rules/ips.mk

#LDFLAGS+=	-lssp_nonshared

build:		$(BUILD_32)

install:	$(INSTALL_32)

