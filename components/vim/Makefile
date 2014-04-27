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

COMPONENT_NAME=		vim
COMPONENT_FMRI=		editor/vim
COMPONENT_VERSION=	7.4
COMPONENT_LICENSE=	VimCharityware
COMPONENT_PROJECT_URL=	"http://www.vim.org"
COMPONENT_SUMMARY=	Vi IMproved
COMPONENT_SRC=		$(COMPONENT_NAME)74
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:d0f5a6d2c439f02d97fa21bd9121f4c5abb1f6cd8b5a79d3ca82867495734ade
COMPONENT_ARCHIVE_URL=	http://ftp.uk.vim.org/pub/vim/unix/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION += ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS+=	--disable-motif-check

build:		$(BUILD_32)

$(BUILD_DIR)/.installed:	$(INSTALL_32)
	cp $(COMPONENT_DIR)/vimrc $(PROTO_DIR)$(ECPREFIX)/share/vim/
	( cd $(PROTO_DIR)$(ECPREFIX)/bin && $(SYMLINK) vim vi )
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
