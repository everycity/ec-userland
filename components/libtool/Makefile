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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libtool
COMPONENT_FMRI=		developer/build/libtool
COMPONENT_VERSION=	2.4.6
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/libtool/"
COMPONENT_SUMMARY=	GNU libtool
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e3bd4d5d3d025a36c21dd6af7ea818a2afcd4dfc1ea5a17b39d7854bcd0c06e3
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS  +=           --infodir=$(CONFIGURE_INFODIR)
CONFIGURE_OPTIONS  +=           --disable-static

# Remove the hard-wired compiler locations in the LTCC and two CC lines
# in the two versions of the libtool script.
COMPONENT_POST_INSTALL_ACTION += \
	(for dir in $(PROTOUSRBINDIR) $(PROTOUSRBINDIR)/$(MACH64) ; do \
		cd $$dir; \
		$(GSED) -i \
			-e 's|^LTCC="/.*$$|LTCC="gcc"|' \
			-e 's|^CC="/.*$$|CC="gcc"|' libtool ; \
	done)

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test32:		$(BUILD_32)
	(cd $(BUILD_DIR_32); env - $(GMAKE) check)

test:	test32

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

