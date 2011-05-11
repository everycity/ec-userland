#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libgsm
COMPONENT_VERSION=	1.0.13
COMPONENT_SRC=		gsm-1.0-pl13
COMPONENT_ARCHIVE=	libgsm_1.0.13.orig.tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:668b0a180039a50d379b3d5a22e78da4b1d90afc
COMPONENT_ARCHIVE_URL=	http://libgsm.sourcearchive.com/downloads/1.0.13-3/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk
include ../../make-rules/shared-targets.mk

COMPONENT_BUILD_ENV+= CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"
COMPONENT_PRE_INSTALL_ACTION+= mkdir -p $(PROTO_DIR)/$(ECPREFIX)/lib \
	$(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64) $(PROTO_DIR)/$(ECPREFIX)/include/gsm \
	$(PROTO_DIR)/$(ECPREFIX)/share/man/man3
COMPONENT_INSTALL_ARGS+= INSTALL_ROOT=$(PROTO_DIR)/$(ECPREFIX)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32) build
	$(INSTALL) $(BUILD_DIR_64)/lib/libgsm.so.1 $(PROTO_DIR)/$(ECPREFIX)/lib/$(MACH64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

