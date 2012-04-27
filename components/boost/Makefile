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

COMPONENT_NAME=		boost
COMPONENT_VERSION=	1.49.0
COMPONENT_OTHER_VERSION= 1_49_0
COMPONENT_SRC=		$(COMPONENT_NAME)_$(COMPONENT_OTHER_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:26a52840e9d12f829e3008589abf0a925ce88524
COMPONENT_ARCHIVE_URL=	\
    http://downloads.sourceforge.net/project/boost/boost/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ENV += CC="$(CC)" CXX="$(CXX)"

#EXECPREFIX.32= $(ECPREFIX)/bin
#EXECPREFIX.64= $(ECPREFIX)/bin/$(MACH64)
#EXECPREFIX= $(EXECPREFIX.$(BITS))

#LIBDIR.32= $(ECPREFIX)/lib
#LIBDIR.32= $(ECPREFIX)/lib/$(MACH64)
#LIBDIR= $(LIBDIR.$(BITS))

JAM=$(ENV) $(COMPONENT_BUILD_ENV) $(@D)/bjam -j10 -d2 --layout=system \
    --ignore-site-config --user-config=$(@D)/user-config.jam \
    debug-symbols=on address-model=$(BITS) --without-mpi

COMPONENT_PRE_BUILD_ACTION = cd $(@D); $(ENV) $(COMPONENT_BUILD_ENV) \
    ./bootstrap.sh --with-icu --prefix=$(ECPREFIX) \
    echo "using gcc ;" >user-config.jam; \
    $(JAM); \
    cd $(@D)/tools/build/v2 && ./bootstrap.sh --with-toolset=gcc; \
    cd $(@D)/tools/bcp && $(JAM); \
    cd $(@D)/tools/inspect/build && $(JAM); \
    cd $(@D)/tools/quickbook && $(JAM); \
    cd $(@D)/tools/wave/build && $(JAM); \
    cd $(@D)/tools/regression/build && $(JAM); \
    cd $(@D)/libs/python/pyste/install && $(PYTHON) setup.py build

COMPONENT_PRE_INSTALL_ACTION = cd $(@D); \
	$(JAM) --prefix=$(PROTO_DIR)$(ECPREFIX) install; \
	cd $(@D)/tools/build/v2 && ./bjam install --prefix=$(PROTO_DIR)$(ECPREFIX)


$(BUILD_32): GMAKE=/bin/true
$(BUILD_64): GMAKE=/bin/true
$(INSTALL_32): GMAKE=/bin/true
$(INSTALL_64): GMAKE=/bin/true

build:		$(BUILD_32)

install:	$(INSTALL_32)
