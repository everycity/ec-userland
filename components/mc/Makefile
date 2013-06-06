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

COMPONENT_NAME=		mc
COMPONENT_VERSION=	4.7.99.2
GIT_ID=			c819eb1fa3e179f237e9c30bb1e738c123da4e81
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-$(GIT_ID).tar.gz
#COMPONENT_ARCHIVE_URL=	git://midnight-commander.org/git/mc.git
COMPONENT_ARCHIVE_URL=	git://repo.or.cz/midnight-commander.git

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D) ; ./autogen.sh; libtoolize; )

CONFIGURE_OPTIONS += LIBS="-L$(ECPREFIX)/lib -lsocket"

download::
	$(COMPONENT_DIR)/generate-tarball.sh $(COMPONENT_ARCHIVE_URL) $(COMPONENT_SRC) $(GIT_ID) $(WS_ARCHIVES)

build:		$(BUILD_32)

install:	$(INSTALL_32)
