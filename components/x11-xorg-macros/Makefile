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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		util-macros
COMPONENT_VERSION=	1.13.0
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	c831ce81a95daf6bbeed24eb43ef5d117c058c27
COMPONENT_ARCHIVE_URL=	http://cgit.freedesktop.org/xorg/util/macros/snapshot/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_PREP_ACTION = (cd $(@D) ; ./autogen.sh --prefix=$(ECPREFIX) )

build:		$(BUILD_32)

install:	build
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/share/aclocal
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/share/pkgconfig
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/share/xorg-macros
	$(CP) $(BUILD_DIR_32)/xorg-macros.m4 $(PROTO_DIR)/$(ECPREFIX)/share/aclocal/
	$(CP) $(BUILD_DIR_32)/xorg-macros.pc $(PROTO_DIR)/$(ECPREFIX)/share/pkgconfig/
	$(CP) $(BUILD_DIR_32)/INSTALL $(PROTO_DIR)/$(ECPREFIX)/share/xorg-macros/

