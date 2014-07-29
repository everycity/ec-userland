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

COMPONENT_NAME=		zsh
COMPONENT_FMRI=         shell/zsh
COMPONENT_VERSION=      5.0.5
COMPONENT_LICENSE=      ZSH/GPL
COMPONENT_PROJECT_URL=  "http://zsh.sourceforge.net/"
COMPONENT_SUMMARY=	Zsh is a shell designed for interactive use, although it is also a powerful scripting language
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:6624d2fb6c8fa4e044d2b009f86ed1617fe8583c83acfceba7ec82826cfa8eaf
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

