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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mongodb
COMPONENT_FMRI=		database/mongodb
COMPONENT_VERSION=	3.2.12
COMPONENT_LICENSE=	APLv2,AGPLv3
COMPONENT_PROJECT_URL=	"http://www.mongodb.org/"
COMPONENT_SUMMARY=	An object/document-oriented database
COMPONENT_SRC=		$(COMPONENT_NAME)-src-r$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:406ced873a9abe8a3f0f92939bf5374663bac86c72181c80bec144aedf6cd306
COMPONENT_ARCHIVE_URL=	http://downloads.mongodb.org/src/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_LICENSE_FILE=	$(COMPONENT_NAME).license

LIBPATH.64=	$(ECPREFIX)/lib/$(MACH64)
LIBPATH=	$(LIBPATH.$(BITS))

COMPONENT_BUILD_TARGETS=	all

COMPONENT_BUILD_ARGS += CXX="$(CXX)" CC="$(CC)"
COMPONENT_BUILD_ARGS += CXXFLAGS="$(CXXFLAGS)" CFLAGS="$(CFLAGS)" LINKFLAGS="$(LDFLAGS)"
COMPONENT_BUILD_ARGS += LIBPATH="$(LIBPATH)"
COMPONENT_BUILD_ARGS += --prefix=$(PROTO_DIR)$(ECPREFIX)
COMPONENT_BUILD_ARGS +=	--release=RELEASE
COMPONENT_BUILD_ARGS += --use-system-pcre=USE-SYSTEM-PCRE
COMPONENT_BUILD_ARGS += --use-system-boost=USE-SYSTEM-BOOST
COMPONENT_BUILD_ARGS += --use-system-tcmalloc=USE-SYSTEM-TCMALLOC
COMPONENT_BUILD_ARGS += --use-system-snappy=USE-SYSTEM-SNAPPY
COMPONENT_BUILD_ARGS +=	--use-system-yaml=USE-SYSTEM-YAML
COMPONENT_BUILD_ARGS +=	--use-system-zlib=USE-SYSTEM-ZLIB
COMPONENT_BUILD_ARGS += --ssl

COMPONENT_INSTALL_ENV = $(COMPONENT_BUILD_ENV)
COMPONENT_INSTALL_ARGS = $(COMPONENT_BUILD_ARGS)

COMPONENT_POST_INSTALL_ACTION =	$(STRIP) $(PROTOUSRBINDIR)/* ;

$(BUILD_DIR)/%/.built:		GMAKE=scons
$(BUILD_DIR)/%/.installed:	GMAKE=scons

build:		$(BUILD_64)

install:	$(INSTALL_64)
