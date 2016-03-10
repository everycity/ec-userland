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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		redis
COMPONENT_FMRI=		database/redis
COMPONENT_VERSION=	2.8.24
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://redis.io/"
COMPONENT_SUMMARY=	Redis is an open source, BSD licensed, advanced key-value store.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6c86ca5291ca7f4e37d9c90511eed67beb6649befe57e2e26307f74adb8630fe
COMPONENT_ARCHIVE_URL=	http://download.redis.io/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

include ../../make-rules/shared-targets.mk

COMPONENT_BUILD_GMAKE_ARGS+= CFLAGS="$(CFLAGS) -D_POSIX_PTHREAD_SEMANTICS" LDFLAGS="$(LDFLAGS)" V=1

COMPONENT_INSTALL_TARGETS += os=solaris PREFIX=$(PROTO_DIR)$(ECPREFIX)
COMPONENT_PRE_INSTALL_ACTION=	( mkdir -p $(PROTO_DIR)$(ECPREFIX)/bin )

build:		$(BUILD_64)

$(BUILD_DIR)/.installed:	$(INSTALL_64)
	for file in $(PROTO_DIR)$(ECPREFIX)/bin/redis*; do strip -x $$file; done
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

include ../../make-rules/depend.mk
