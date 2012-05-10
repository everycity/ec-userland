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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mimms
COMPONENT_VERSION_MJR=	3.2
COMPONENT_VERSION_MNR=	1
COMPONENT_VERSION=	$(COMPONENT_VERSION_MJR).$(COMPONENT_VERSION_MNR)
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:279eee76dd4032cd2c1dddf1d49292a952c57b80
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_SAVANNAH)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

PYTHON=		$(ECPREFIX)/bin/python2.6

$(BUILD_DIR)/%/.built:  $(SOURCE_DIR)/.prep
	$(RM) -r $(@D) ; $(MKDIR) $(@D)
	$(CLONEY) $(SOURCE_DIR) $(@D)
	(cd $(@D) ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(PYTHON) setup.py bdist)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)
	(cd $(PROTO_DIR) ; $(ECPREFIX)/bin/tar -zxf \
		$(@D)/dist/$(COMPONENT_NAME)-$(COMPONENT_VERSION_MJR).solaris-$(SOLARIS_VERSION)-i86pc.tar.gz)
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)

