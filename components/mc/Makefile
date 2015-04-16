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

COMPONENT_NAME=		mc
COMPONENT_FMRI=		file/mc
COMPONENT_VERSION=	4.8.13.99
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.midnight-commander.org/"
COMPONENT_SUMMARY=	The GNU Midnight Commander file manager
GIT_ID=			7695f0acf7f640d2cb9f66ec15273a515563ad9f
GIT_URL=		https://github.com/MidnightCommander/mc.git
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-$(GIT_ID).tar.bz2

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D) ; ./autogen.sh; libtoolize; )

CONFIGURE_OPTIONS+=	--libexecdir=$(USRDIR)/lib

download::
	$(COMPONENT_DIR)/generate-tarball.sh $(GIT_URL) \
		$(COMPONENT_SRC) $(GIT_ID) $(USERLAND_ARCHIVES)

build:		$(BUILD_32)

install:	$(INSTALL_32)
