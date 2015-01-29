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

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=         automake
COMPONENT_FMRI=		developer/build/automake-114
COMPONENT_VERSION=      1.14
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/automake/"
COMPONENT_SUMMARY=	Automake is a tool for automatically generating Makefile.in files compliant with the GNU Coding Standards.
COMPONENT_SRC=          $(COMPONENT_NAME)-$(COMPONENT_VERSION).1
COMPONENT_ARCHIVE=      $(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH= sha256:a9b4f04b8b69cac2e832a38a718943aa976dbdad0097211f8b3448afdacf0669
COMPONENT_ARCHIVE_URL=  $(DOWNLOAD_GNU_FTP)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

CONFIGURE_OPTIONS  +=	--infodir=$(CONFIGURE_INFODIR)

# common targets
build:		$(BUILD_32)

install:	$(INSTALL_32)

test:		$(TEST_32)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include $(WS_TOP)/make-rules/depend.mk
