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
# Copyright 2011,2012 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gmp
COMPONENT_FMRI=		library/gmp
COMPONENT_VERSION=	5.1.2
COMPONENT_LICENSE=	LGPLv3
COMPONENT_PROJECT_URL=	http://www.gmplib.org/
COMPONENT_SUMMARY=	The GNU Multiple Precision (Bignum) Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:2099deea64ef3e58ac2b42eaaa0286c3231430a8e893359d806bfa31611c1b8f
COMPONENT_ARCHIVE_URL=	ftp://ftp.gmplib.org/pub/$(COMPONENT_NAME)-$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS += -std=gnu99
CFLAGS += $(CC_PIC)
CXXFLAGS += -std=gnu99
CXXFLAGS += $(CC_PIC)
CPPFLAGS += $(CPP_LARGEFILES)
LDFLAGS += $(LD_Z_REDLOCSYM) $(LD_Z_RESCAN_NOW)
LDFLAGS += -nodefaultlibs -lc

# assembler detection for GNU MP and GNU MPFR is done via MPN_PATH
# at ./configure time. GNU MPFR wants to know GNU MP's MPN_PATH.
MPN32_i386 = x86/pentium x86 generic
MPN64_i386 = x86_64/pentium4 x86_64 generic
MPN32_sparc = sparc32/v9 sparc32 generic
MPN64_sparc = sparc64 generic
MPN_32 = $(MPN32_$(MACH))
MPN_64 = $(MPN64_$(MACH))
# libgmpxx.so.4 always gets built with unnecessary paths in RUNPATH/RPATH
#ELFEDIT = /usr/bin/elfedit

CONFIGURE_ENV += LD="$(CC) $(CFLAGS) $(LDFLAGS)"
CONFIGURE_ENV += CXXLD="$(CXX) $(CC_BITS) $(CXXFLAGS) $(LDFLAGS)"
CONFIGURE_ENV += CPP="$(CC) $(CPPFLAGS) $(CFLAGS) -E"
CONFIGURE_ENV += CPP_FOR_BUILD="$(CC) $(CPPFLAGS) $(CFLAGS) -E"
CONFIGURE_ENV += CXXCPP="$(CXX) $(CC_BITS) $(CPPFLAGS) $(CXXFLAGS) -E"
CONFIGURE_ENV += CC_FOR_BUILD="$(CC) $(CPPFLAGS) $(CFLAGS)"
CONFIGURE_ENV += M4="$(GM4)"
CONFIGURE_ENV += ABI="$(BITS)"
CONFIGURE_ENV += MPN_PATH="$(MPN_$(BITS))"

CONFIGURE_OPTIONS += --localstatedir=/var
CONFIGURE_OPTIONS += --enable-shared
CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --disable-libtool-lock
CONFIGURE_OPTIONS += --disable-alloca
CONFIGURE_OPTIONS += --enable-cxx
CONFIGURE_OPTIONS += --enable-fft
CONFIGURE_OPTIONS += --enable-mpbsd
CONFIGURE_OPTIONS += --disable-fat
CONFIGURE_OPTIONS += --with-pic

# common targets
build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test: $(TEST_32_and_64)

BUILD_PKG_DEPENDENCIES = $(BUILD_TOOLS)

include ../../make-rules/depend.mk
