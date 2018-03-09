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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		boost
COMPONENT_FMRI=		library/boost
COMPONENT_VERSION=	1.66.0
COMPONENT_OTHER_VERSION= 1_66_0
COMPONENT_LICENSE=	Boost Software License v1.0
COMPONENT_LICENSE_FILE=	LICENSE_1_0.txt
COMPONENT_PROJECT_URL=	"http://www.boost.org/"
COMPONENT_SUMMARY=	Boost C++ Libraries
COMPONENT_SRC=		$(COMPONENT_NAME)_$(COMPONENT_OTHER_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:5721818253e6a0989583192f96782c4a98eb6204965316df9f5ad75819225ca9
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF2)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

#CFLAGS +=	-std=c99
CXXFLAGS +=	-std=c++0x
COMPONENT_BUILD_ENV += CC="$(CC)" CXX="$(CXX)" CPPFLAGS="$(CPPFLAGS)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)"

LIBDIR.32= $(USRDIR)/lib
LIBDIR.64= $(USRDIR)/lib/$(MACH64)
LIBDIR= $(LIBDIR.$(BITS))

BJAM=./b2 --v2 -d+2 -j4 -q address-model=$(BITS) \
    --user-config=./user-config.jam \
    -sBUILD="release <threading>single/multi" \
    --prefix=$(PROTO_DIR)$(USRDIR) \
    --libdir=$(PROTO_DIR)$(LIBDIR)

COMPONENT_PRE_BUILD_ACTION = cd $(@D); \
	echo 'using gcc : 4.8.5 : $(CXX) : <cflags>"$(CFLAGS) $(CC_PIC) -pthreads" <cxxflags>"$(CXXFLAGS) $(CC_PIC)" <linkflags>"$(LDFLAGS)" ;' > ./user-config.jam; \
	$(ENV) $(COMPONENT_BUILD_ENV) ./bootstrap.sh --prefix=$(USRDIR) --libdir=$(LIBDIR) --with-toolset=gcc --with-icu=$(USRDIR); \
	$(BJAM) release stage

COMPONENT_PRE_INSTALL_ACTION = cd $(@D); $(BJAM) install

$(BUILD_32): GMAKE=/bin/true
$(BUILD_64): GMAKE=/bin/true
$(INSTALL_32): GMAKE=/bin/true
$(INSTALL_64): GMAKE=/bin/true

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
