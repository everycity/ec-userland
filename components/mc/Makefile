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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mc
COMPONENT_VERSION=	4.8.13.99
GIT_ID=			7695f0acf7f640d2cb9f66ec15273a515563ad9f
GIT_URL=		https://github.com/MidnightCommander/mc.git
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-$(GIT_ID).tar.bz2

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D) ; ./autogen.sh; libtoolize; )

#CONFIGURE_OPTIONS += LIBS="-L$(ECPREFIX)/lib -lsocket"

download::
	$(COMPONENT_DIR)/generate-tarball.sh $(GIT_URL) \
		$(COMPONENT_SRC) $(GIT_ID) $(USERLAND_ARCHIVES)

build:		$(BUILD_32)

install:	$(INSTALL_32)
