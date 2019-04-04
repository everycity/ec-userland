#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2013 Andrzej Szeszo.  All rights reserved.
# Copyright 2016-2018 Aurelien Larcher. All rights reserved.
# Copyright 2019 EveryCity Ltd.  All rights reserved.
#
CONFIGURE_DEFAULT_LDFLAGS = no
CONFIGURE_DEFAULT_CPPFLAGS = no

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gcc
COMPONENT_FMRI=		developer/gcc-8
COMPONENT_VERSION=	8.2.0
COMPONENT_SUMMARY=	GNU Compiler Collection
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080
COMPONENT_ARCHIVE_URL=	http://ftp.gnu.org/gnu/gcc/gcc-$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL=	http://gcc.gnu.org/

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

PATH=$(dir $(CC)):$(USRDIR)/bin:/usr/bin

CFLAGS_i386 = -mtune=opteron -march=opteron
CFLAGS_sparc = -mtune=ultrasparc -mcpu=ultrasparc -mno-unaligned-doubles
CFLAGS := -g -O2
CFLAGS += $(CFLAGS_$(MACH))
CFLAGS_FOR_BUILD=$(CFLAGS)

CXXFLAGS := -g -O2
CXXFLAGS += $(CFLAGS_$(MACH))

# CC_BITS may get in the way
CC_BITS=

GCC_LD_OPTIONS.sparc=-M /usr/lib/ld/map.noexstk -M /usr/lib/ld/map.pagealign -z ignore
GCC_LD_OPTIONS.i386=-M /usr/lib/ld/map.noexstk -M /usr/lib/ld/map.pagealign -z ignore
GCC_LD_OPTIONS = $(GCC_LD_OPTIONS.$(MACH))
LD_OPTIONS := $(GCC_LD_OPTIONS)

CONFIG_SHELL = /bin/sh
MAKESHELL = /bin/sh

CONFIGURE_PREFIX = $(USRDIR)/gcc/8

CONFIGURE_OPTIONS += --infodir=$(CONFIGURE_PREFIX)/share/info
CONFIGURE_OPTIONS += --libexecdir=$(CONFIGURE_PREFIX)/lib
CONFIGURE_OPTIONS += --enable-plugins
#CONFIGURE_OPTIONS+= --enable-objc-gc
CONFIGURE_OPTIONS += --enable-initfini-array
CONFIGURE_OPTIONS += --enable-tls
CONFIGURE_OPTIONS += --enable-languages=c,c++,fortran,lto,objc
CONFIGURE_OPTIONS += --enable-targets=$(GNU_ARCH_64)
CONFIGURE_OPTIONS += --without-gnu-ld
CONFIGURE_OPTIONS += --with-ld=/usr/bin/ld
CONFIGURE_OPTIONS += --with-gmp=$(USRDIR)
CONFIGURE_OPTIONS += --with-mpc=$(USRDIR)
CONFIGURE_OPTIONS += --with-mpfr=$(USRDIR)
CONFIGURE_OPTIONS += --with-libiconv-prefix=$(USRDIR)
CONFIGURE_OPTIONS += --disable-libitm
CONFIGURE_OPTIONS += enable_frame_pointer=yes

# On SPARC systems, use Sun Assembler
CONFIGURE_OPTIONS.sparc+= --without-gnu-as --with-as=$(USRDIR)/bin/as
CONFIGURE_OPTIONS.i386+= --with-gnu-as --with-as=$(USRDIR)/bin/gas
CONFIGURE_OPTIONS+= $(CONFIGURE_OPTIONS.$(MACH))

COMPONENT_BUILD_ENV += SHELL="$(CONFIG_SHELL)"
COMPONENT_BUILD_ENV += MAKESHELL="$(MAKESHELL)"

COMPONENT_POST_INSTALL_ACTION = \
  $(RM) -r $(PROTO_DIR)$(CONFIGURE_PREFIX)/lib/gcc/$(GNU_ARCH)/$(COMPONENT_VERSION)/include-fixed

unexport SHELLOPTS

#
# Run the tests and generate a summary report, then output the summary
# report into the results file. Note that list of reported tests is sorted
# to allow parallel test run.
#
# To ensure that all tests that are expected to pass actually
# pass, we have to increase the stacksize limit to at least
# 16MB. Otherwise we'll get spurious failures in the test
# harness (gcc.c-torture/compile/limits-exprparen.c and others).
# With the soft stacksize limit set to 16384 we get reasonably good
# test results.
#
COMPONENT_PRE_TEST_ACTION += \
	(cd $(COMPONENT_TEST_DIR) ; \
	 ulimit -Ss 16385 ; \
	 $(ENV) $(COMPONENT_PRE_TEST_ENV) \
	        $(GMAKE) -k -i $(JOBS:%=-j%) check check-target RUNTESTFLAGS="--target_board=unix/\{,-msave-args\}" ; \
	 $(FIND) . -name  '*.sum' | while read f; do \
	        gsed -e '1,/^Running target unix/p' -e  'd' $f > $f.2; \
	        gsed -e '/^Running target unix/,/Summary ===$/p' -e  'd' $f | grep  '^.*: ' | sort -k 2 >> $f.2; \
	        gsed -e '/Summary ===$/,$p' -e  'd' $f >> $f.2; \
	        mv $f.2 $f; done; \
	 $(GMAKE) mail-report.log)

COMPONENT_TEST_CMD = $(CAT)
COMPONENT_TEST_TARGETS = mail-report.log

# Master test results are different between x86 and SPARC.
COMPONENT_TEST_MASTER = \
	$(COMPONENT_TEST_RESULTS_DIR)/results-$(MACH).master

build: $(BUILD_32)

install: $(INSTALL_32)

test: $(TEST_32)
