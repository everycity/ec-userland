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

#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

# Note: One of the patches has /ec hardcoded

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pkg-gate
COMPONENT_VERSION=	20100311
COMPONENT_SRC=		$(COMPONENT_NAME)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:5389cb2db10cc6e2c33beb06fd9da03e29339fa5
COMPONENT_ARCHIVE_URL= http://dlc-int.openindiana.org/aszeszo/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk
include ../../make-rules/no-pkgdepend.mk

# Don't deliver the standard manifests
PUBLISH_TRANSFORMS+=	$(COMPONENT_DIR)/transform-drop-lib-svc

PKGLINT = /bin/true

IPS_COMPONENT_VERSION=  0.$(COMPONENT_VERSION)

COMPONENT_BUILD_ENV= true; cd $(@D)/src; $(ENV)
COMPONENT_INSTALL_ENV= true; cd $(@D)/src; $(ENV)

build:		$(BUILD_32)

install:	$(INSTALL_32)	
	$(MKDIR) -p $(PROTO_DIR)
	$(CP) -R $(BUILD_DIR_32)/proto/root_$(MACH)/* $(PROTO_DIR)
	sed "1s,^#!.*,#!$(PYTHON)," \
	    < $(BUILD_DIR_32)/proto/root_$(MACH)$(ECPREFIX)/bin/cherryd \
	    > $(PROTO_DIR)$(ECPREFIX)/bin/cherryd

