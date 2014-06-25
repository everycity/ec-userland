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
# Copyright 2011-2013 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		sed
COMPONENT_FMRI=		text/gnu-sed
COMPONENT_VERSION=	4.2.2
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	http://www.gnu.org/software/sed/
COMPONENT_SUMMARY=	GNU implementation of sed, the Unix stream editor
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:f048d1838da284c8bc9753e4506b85a1e0cc1ea8999d36f6995bcb9460cddbd7
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

test32:		$(BUILD_32)
	(cd $(BUILD_DIR_32); env - $(GMAKE) check)

test:	test32

