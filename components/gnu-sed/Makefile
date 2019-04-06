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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		sed
COMPONENT_FMRI=		text/gnu-sed
COMPONENT_VERSION=	4.7
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	http://www.gnu.org/software/sed/
COMPONENT_SUMMARY=	GNU implementation of sed, the Unix stream editor
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:2885768cd0a29ff8d58a6280a270ff161f6a3deb5690b2be6c49f46d4c67bd6a
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

CONFIGURE_OPTIONS +=	--program-prefix=g

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	cd $(PROTOUSRBINDIR) && $(SYMLINK) gsed sed
	cd $(PROTOUSRBINDIR64) && $(SYMLINK) gsed sed
	cd $(PROTOUSRSHAREMAN1DIR) && $(SYMLINK) gsed.1 sed.1
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
