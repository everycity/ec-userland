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

COMPONENT_NAME=		exim
COMPONENT_VERSION=	4.75
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:4a7cfaf70ddcfde58b8e68c98aeb6b61856b0abd
COMPONENT_ARCHIVE_URL=	ftp://ftp.exim.org/pub/exim/exim4/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk
include ../../make-rules/shared-targets.mk

COMPONENT_PREP_ACTION+= cp $(SOURCE_DIR)/src/EDITME $(SOURCE_DIR)/Local/Makefile
COMPONENT_PRE_BUILD_ACTION+=	cp -r $(SOURCE_DIR)/* $(@D)
COMPONENT_INSTALL_ENV+= DESTDIR=$(PROTO_DIR)
COMPONENT_POST_INSTALL_ACTION+= mkdir -p $(PROTO_DIR)/$(ECPREFIX)/var/log/exim ; \
	touch $(PROTO_DIR)/$(ECPREFIX)/var/log/exim/main.log ; \
	touch $(PROTO_DIR)/$(ECPREFIX)/var/log/exim/panic.log ; \
	touch $(PROTO_DIR)/$(ECPREFIX)/var/log/exim/reject.log ; \
	mkdir -p $(PROTO_DIR)/$(ECPREFIX)/var/svc/method ; \
	mkdir -p $(PROTO_DIR)/var/svc/manifest/site ; \
	cp $(COMPONENT_DIR)/exim-startup.sh $(PROTO_DIR)/$(ECPREFIX)/var/svc/method/exim.sh ; \
	cp $(COMPONENT_DIR)/exim-manifest.xml $(PROTO_DIR)/var/svc/manifest/site/ec-exim.xml


#$(SOURCE_DIR)/.unpacked:
#	echo mooop

#build:		$(BUILD_32_and_64)
build:		$(BUILD_32)

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
