#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2014, Igor Kozhukhov <ikozhukhov@gmail.com>.
# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
#
include ../../../make-rules/shared-macros.mk

#PATH=/usr/bin:/usr/gnu/bin:/usr/sbin

COMPONENT_NAME=		setuptools
COMPONENT_VERSION=	0.6c11
COMPONENT_PROJECT_URL=	http://pypi.python.org/pypi/setuptools
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:8d1ad6384d358c547c50c60f1bfdb3362c6c4a7d
COMPONENT_ARCHIVE_URL=	http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz


include ../../../make-rules/prep.mk
include ../../../make-rules/setup.py.mk
include ../../../make-rules/ips.mk

IPS_COMPONENT_VERSION=  0.6.3.11

PYTHON_VERSIONS = 2.7 2.6

# common targets
build:		$(BUILD_32)

install:	$(INSTALL_32)

test:
	@echo "no tests available"

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../../make-rules/depend.mk
