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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		boost
COMPONENT_FMRI=		library/boost
COMPONENT_VERSION=	1.61.0
COMPONENT_OTHER_VERSION= 1_61_0
COMPONENT_LICENSE=	Boost Software License v1.0
COMPONENT_LICENSE_FILE=	LICENSE_1_0.txt
COMPONENT_PROJECT_URL=	"http://www.boost.org/"
COMPONENT_SUMMARY=	Boost C++ Libraries
COMPONENT_SRC=		$(COMPONENT_NAME)_$(COMPONENT_OTHER_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:a547bd06c2fd9a71ba1d169d9cf0339da7ebf4753849a8f7d6fdb8feee99b640
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

LIBDIR.32= $(USRDIR)/lib
LIBDIR.64= $(USRDIR)/lib/$(MACH64)
LIBDIR= $(LIBDIR.$(BITS))

CXXFLAGS+=	-std=c++11

BJAM=./b2 --v2 -d+2 -j4 -q address-model=$(BITS) \
    -sBUILD="release <threading>single/multi" \
    --user-config=./user-config.jam \
    --prefix=$(PROTO_DIR)$(USRDIR) \
    --libdir=$(PROTO_DIR)$(LIBDIR) \
    cxxflags=-std=c++11

COMPONENT_PRE_BUILD_ACTION = cd $(@D); \
	echo 'using gcc : 4.8.5 : $(CXX) : <cflags>"$(CFLAGS) $(CC_PIC) -pthreads" <cxxflags>"$(CXXFLAGS)" <linkflags>"$(LDFLAGS)" ;' > ./user-config.jam; \
	$(ENV) $(COMPONENT_BUILD_ENV) \
	./bootstrap.sh --prefix=$(USRDIR) --libdir=$(LIBDIR) \
        --with-toolset=gcc --with-icu=$(USRDIR); \
    $(BJAM) release stage

COMPONENT_PRE_INSTALL_ACTION = cd $(@D); \
    $(BJAM) install

$(BUILD_32): GMAKE=/bin/true
$(BUILD_64): GMAKE=/bin/true
$(INSTALL_32): GMAKE=/bin/true
$(INSTALL_64): GMAKE=/bin/true

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
