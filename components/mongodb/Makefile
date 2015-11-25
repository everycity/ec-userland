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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mongodb
COMPONENT_FMRI=		database/mongodb
COMPONENT_VERSION=	2.6.11
COMPONENT_LICENSE=	APLv2,AGPLv3
COMPONENT_PROJECT_URL=	"http://www.mongodb.org/"
COMPONENT_SUMMARY=	An object/document-oriented database
COMPONENT_SRC=		$(COMPONENT_NAME)-src-r$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e1a64a1ef7114f3e8ed3c7acaa4e97ffe30e2b57a1a5f2a40f0018bad3b8d12f
COMPONENT_ARCHIVE_URL=	http://downloads.mongodb.org/src/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

LIBPATH.32=	$(ECPREFIX)/lib
LIBPATH.64=	$(ECPREFIX)/lib/$(MACH64)
LIBPATH=	$(LIBPATH.$(BITS))

COMPONENT_BUILD_TARGETS=	all

COMPONENT_BUILD_ARGS += --prefix=$(PROTO_DIR)$(ECPREFIX)
COMPONENT_BUILD_ARGS += --cc="$(CC)" --cxx="$(CXX)"
COMPONENT_BUILD_ARGS += --libpath=$(LIBPATH)
COMPONENT_BUILD_ARGS += --extralib=rt
COMPONENT_BUILD_ARGS += --$(BITS)
COMPONENT_BUILD_ARGS += --use-system-pcre=USE-SYSTEM-PCRE
COMPONENT_BUILD_ARGS += --use-system-boost=USE-SYSTEM-BOOST
COMPONENT_BUILD_ARGS += --use-system-tcmalloc=USE-SYSTEM-TCMALLOC
COMPONENT_BUILD_ARGS += --use-system-snappy=USE-SYSTEM-SNAPPY
COMPONENT_BUILD_ARGS += --ssl

COMPONENT_INSTALL_ENV = $(COMPONENT_BUILD_ENV)
COMPONENT_INSTALL_ARGS = $(COMPONENT_BUILD_ARGS)
COMPONENT_INSTALL_ARGS+= --full

$(BUILD_DIR)/%/.built:		GMAKE=scons
$(BUILD_DIR)/%/.installed:	GMAKE=scons

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

