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

COMPONENT_NAME=		libXtst
COMPONENT_FMRI=         x11/library/libxtst
COMPONENT_VERSION=      1.2.2
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://cgit.freedesktop.org/xorg/lib/libXtst/"
COMPONENT_SUMMARY=	X.org libXtst library.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:221838960c7b9058cd6795c1c3ee8e25bae1c68106be314bc3036a4f26be0e6c
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_XORG_LIB)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	cd $(PROTO_DIR)$(ECPREFIX)/lib && $(SYMLINK) libXtst.so.6.1.0 libXtst.so.1
	cd $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64) && $(SYMLINK) libXtst.so.6.1.0 libXtst.so.1
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

