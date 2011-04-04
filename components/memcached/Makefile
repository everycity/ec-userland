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

COMPONENT_NAME=		memcached
COMPONENT_VERSION=	1.4.5
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:c7d6517764b82d23ae2de76b56c2494343c53f02
COMPONENT_ARCHIVE_URL=	http://memcached.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#COMPONENT_PRE_CONFIGURE_ACTION += cp $(SOURCE_DIR)/memcached_dtrace.d $(@D)
#CONFIGURE_OPTIONS.32 += --enable-dtrace
#CONFIGURE_OPTIONS.64 += --enable-dtrace
CONFIGURE_OPTIONS.64 += --enable-64bit

COMPONENT_POST_INSTALL_ACTION+= mkdir -p $(PROTO_DIR)/$(ECPREFIX)/var/svc/method ; \
        mkdir -p $(PROTO_DIR)/var/svc/manifest/site ; \
        cp $(COMPONENT_DIR)/memcached-startup.sh $(PROTO_DIR)/$(ECPREFIX)/var/svc/method/memcached.sh ; \
        cp $(COMPONENT_DIR)/memcached-manifest.xml $(PROTO_DIR)/var/svc/manifest/site/ec-memcached.xml


build:		$(BUILD_32_and_64)

include ../../make-rules/shared-targets.mk

install:	$(INSTALL_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
