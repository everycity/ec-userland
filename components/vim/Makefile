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
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		vim
COMPONENT_VERSION=	7.3
COMPONENT_SRC=		$(COMPONENT_NAME)73
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:46faa96c5fab639899b1c655c23d8755b62f036f
COMPONENT_ARCHIVE_URL=	http://ftp.uk.vim.org/pub/vim/unix/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION += cp -r $(SOURCE_DIR)/* $(@D)

CONFIGURE_OPTIONS+=	--disable-motif-check

build:		$(BUILD_32)

install:	$(INSTALL_32)
	cp $(COMPONENT_DIR)/vimrc $(PROTO_DIR)/$(ECPREFIX)/share/vim/
