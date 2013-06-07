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
# Copyright 2012-2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		boost
COMPONENT_VERSION=	1.49.0
COMPONENT_OTHER_VERSION= 1_49_0
COMPONENT_SRC=		$(COMPONENT_NAME)_$(COMPONENT_OTHER_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:dd748a7f5507a7e7af74f452e1c52a64e651ed1f7263fce438a06641d2180d3c
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ENV += CC="$(CC)" CXX="$(CXX)" LDFLAGS="$(LDFLAGS)"

LIBDIR.32= $(ECPREFIX)/lib
LIBDIR.64= $(ECPREFIX)/lib/$(MACH64)
LIBDIR= $(LIBDIR.$(BITS))

BJAM=./bjam --v2 -d+2 -j10 -q address-model=$(BITS) \
    -sBUILD="release <threading>single/multi" \
    --prefix=$(PROTO_DIR)$(ECPREFIX) \
    --libdir=$(PROTO_DIR)$(LIBDIR)


COMPONENT_PRE_BUILD_ACTION = cd $(@D); $(ENV) $(COMPONENT_BUILD_ENV) \
    ./bootstrap.sh --prefix=$(ECPREFIX) --libdir=$(LIBDIR) \
        --with-toolset=gcc --with-icu=$(ECPREFIX); \
    $(BJAM) release stage

COMPONENT_PRE_INSTALL_ACTION = cd $(@D); \
    $(BJAM) install

$(BUILD_32): GMAKE=/bin/true
$(BUILD_64): GMAKE=/bin/true
$(INSTALL_32): GMAKE=/bin/true
$(INSTALL_64): GMAKE=/bin/true

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
