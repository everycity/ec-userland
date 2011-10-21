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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ghc
COMPONENT_VERSION=	7.0.3
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-i386-unknown-solaris2.tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:2b06d57fc72c0bfbeed25c7f9f28d19aa6a0b306
COMPONENT_ARCHIVE_URL=	http://haskell.org/ghc/dist/7.0.3/maeder/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

$(BUILD_DIR)/%/.built:  $(BUILD_DIR)/%/.configured
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)

