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

COMPONENT_NAME=		nasm
COMPONENT_FMRI=		developer/assembler/nasm
COMPONENT_VERSION=	2.11.02
IPS_COMPONENT_VERSION=	2.11.2
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.nasm.us/"
COMPONENT_SUMMARY=	The Netwide Assembler
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:781290ff457e6f59e10c7da12b65180189bb26ca6015cf7fdfd531c4b2b3eedc
COMPONENT_ARCHIVE_URL=	http://www.nasm.us/pub/nasm/releasebuilds/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_POST_CONFIGURE_ACTION += (mkdir -p $(BUILD_DIR_32)/lib $(BUILD_DIR_64)/lib)
CONFIGURE_OPTIONS += CFLAGS="$(CFLAGS) -I$(BUILD_DIR_$(BITS))"
COMPONENT_INSTALL_ENV += INSTALLROOT="$(PROTO_DIR)"

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

