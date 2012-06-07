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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mongodb
COMPONENT_VERSION=	2.0.6
COMPONENT_SRC=		$(COMPONENT_NAME)-src-r$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:bad1da30f8aeaa5d1ca7994e8f9def07725da7e5
COMPONENT_ARCHIVE_URL=	http://downloads.mongodb.org/src/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

LIBPATH.32=	$(ECPREFIX)/lib
LIBPATH.64=	$(ECPREFIX)/lib/$(MACH64)
LIBPATH=	$(LIBPATH.$(BITS))

#COMPONENT_BUILD_ENV += LDFLAGS="$(LDFLAGS)"
#COMPONENT_BUILD_ENV += LINKFLAGS="$(LDFLAGS)"

COMPONENT_BUILD_ARGS += --prefix=$(PROTO_DIR)$(ECPREFIX)
COMPONENT_BUILD_ARGS += --cc="$(CC)" --cxx="$(CXX)"
COMPONENT_BUILD_ARGS += --libpath=$(LIBPATH)
COMPONENT_BUILD_ARGS += --extralib=rt
COMPONENT_BUILD_ARGS += --$(BITS)
#COMPONENT_BUILD_ARGS += --use-system-sm --use-system-pcre

COMPONENT_INSTALL_ENV = $(COMPONENT_BUILD_ENV)
COMPONENT_INSTALL_ARGS = $(COMPONENT_BUILD_ARGS)
COMPONENT_INSTALL_ARGS+ = --full

$(BUILD_DIR)/%/.built:		GMAKE=scons
$(BUILD_DIR)/%/.installed:	GMAKE=scons

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
