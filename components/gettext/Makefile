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

COMPONENT_NAME=		gettext
COMPONENT_FMRI=		text/gnu-gettext
COMPONENT_VERSION=	0.18.3.1
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/gettext/"
COMPONENT_SUMMARY=	GNU gettext
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:0d8f9a33531b77776b3dc473e7940019ca19bfca5b4c06db6e96065eeb07245d
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-included-glib
CONFIGURE_OPTIONS+=	--without-git

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

