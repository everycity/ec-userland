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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tcl
COMPONENT_FMRI=         runtime/tcl-8
COMPONENT_VERSION=      8.6.1
COMPONENT_LICENSE=      tcl
COMPONENT_PROJECT_URL=  http://tcl.sourceforge.net
COMPONENT_SUMMARY=	Tool Command Language (Tcl) is an interpreted language and very portable interpreter for that language
COMPONENT_SRC=		$(COMPONENT_NAME)$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-src.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:16ee769248e64ba1cae6b4834fcc4e4edd7470d881410e8d58f7dd1434343514
COMPONENT_ARCHIVE_URL=	http://surfnet.dl.sourceforge.net/project/tcl/Tcl/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION+=	( cd $(SOURCE_DIR)/unix && autoconf )
CONFIGURE_SCRIPT=	$(SOURCE_DIR)/unix/configure
CONFIGURE_OPTIONS.64+=	--enable-64bit

ifeq ($(SOLARIS_VERSION), 2.10)
build:		$(BUILD_32)
install:	$(INSTALL_32)
endif
ifeq ($(SOLARIS_VERSION),2.11)
build:		$(BUILD_32_and_64)
install:	$(INSTALL_32_and_64)
endif
