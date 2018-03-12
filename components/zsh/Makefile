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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		zsh
COMPONENT_FMRI=         shell/zsh
COMPONENT_VERSION=      5.4.2
COMPONENT_LICENSE=      ZSH/GPL
COMPONENT_LICENSE_FILE=	LICENCE
COMPONENT_PROJECT_URL=  "http://zsh.sourceforge.net/"
COMPONENT_SUMMARY=	Zsh is a shell designed for interactive use, although it is also a powerful scripting language
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:957bcdb2c57f64c02f673693ea5a7518ef24b6557aeb3a4ce222cefa6d74acc9
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS+=	-I$(USRPREFIX)/include/ncurses -D__EXTENSIONS__
CFLAGS+=	-std=c99
LIBS+=		-ltinfo

CONFIGURE_OPTIONS+=	--enable-maildir-support
CONFIGURE_OPTIONS+=	--enable-pcre
CONFIGURE_OPTIONS+=	--enable-multibyte
CONFIGURE_OPTIONS+=	--disable-gdbm

COMPONENT_PRE_CONFIGURE_ACTION+=	( cd $(SOURCE_DIR) ; autoreconf -fiv )

build:		$(BUILD_32)

install:	$(INSTALL_32)

