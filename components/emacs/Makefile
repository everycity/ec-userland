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

COMPONENT_NAME=		emacs
COMPONENT_FMRI=		editor/emacs
COMPONENT_VERSION=	24.4
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	http://www.gnu.org/software/emacs/
COMPONENT_SUMMARY=	GNU Emacs is an extensible, customizable text editor - and more.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:47e391170db4ca0a3c724530c7050655f6d573a711956b4cd84693c194a9d4fd
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS+=	-D__EXTENSIONS__

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

