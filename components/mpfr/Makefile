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
# Copyright 2011-2014 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		mpfr
COMPONENT_FMRI=		library/mpfr
COMPONENT_VERSION=	3.1.2
COMPONENT_LICENSE=	LGPLv3
COMPONENT_PROJECT_URL=	http://www.mpfr.org/
COMPONENT_SUMMARY=	MPFR library - C library for multiple-precision floating-point computations with correct rounding
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH= \
    sha256:79c73f60af010a30a5c27a955a1d2d01ba095b72537dab0ecaad57f5a7bb1b6b
COMPONENT_ARCHIVE_URL=	http://www.mpfr.org/mpfr-current/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS += $($CC_PIC)
LDFLAGS += $(LD_Z_REDLOCSYM) $(LD_Z_RESCAN_NOW)
LDFLAGS += -nodefaultlibs -lc

MPN32_i386 = x86/pentium x86 generic
MPN64_i386 = x86_64/pentium4 x86_64 generic
MPN32_sparc = sparc32/v9 sparc32 generic
MPN64_sparc = sparc64 generic
MPN32 = $(MPN32_$(MACH))
MPN64 = $(MPN64_$(MACH))

MPFRMULHIGH = 2048

CONFIGURE_ENV += LD="$(CC) $(CFLAGS) $(LDFLAGS)"
CONFIGURE_ENV += CPP="$(CC) $(CPPFLAGS) $(CFLAGS) -E"
CONFIGURE_ENV += ABI="$(BITS)"
CONFIGURE_ENV += MPN_PATH="$(MPN_$(BITS))"

CONFIGURE_OPTIONS += --localstatedir=$(CONFIGURE_LOCALSTATEDIR)
CONFIGURE_OPTIONS += --enable-shared
CONFIGURE_OPTIONS += --disable-static
CONFIGURE_OPTIONS += --disable-libtool-lock
CONFIGURE_OPTIONS += --enable-thread-safe
CONFIGURE_OPTIONS += --enable-tests-timeout=0
CONFIGURE_OPTIONS += --with-mulhigh-size=$(MPFRMULHIGH)
CONFIGURE_OPTIONS += --with-pic

# common targets
build: $(BUILD_32_and_64)

install: $(INSTALL_32_and_64)

test: $(TEST_32_and_64)

BUILD_PKG_DEPENDENCIES = $(BUILD_TOOLS)

include ../../make-rules/depend.mk
