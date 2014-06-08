#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2014, Igor Kozhukhov <ikozhukhov@gmail.com>
#
CONFIGURE_DEFAULT_LDFLAGS = no
CONFIGURE_DEFAULT_CPPFLAGS = no

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gcc
COMPONENT_VERSION=	4.8.2
COMPONENT_PROJECT_URL=	http://gcc.gnu.org/
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH= \
    sha256:2ea77114344a06c45dd5791275311e91d306545aa5ec9db31d24174f6965e880
COMPONENT_ARCHIVE_URL=	http://ftp.gnu.org/gnu/gcc/$(COMPONENT_SRC)/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=        utility/gnu-compiler

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

# The GNU compiler wants the GNU utilities.
#PATH.i386=/usr/gnu/bin:/usr/bin:$(dir $(PERL))
#PATH.sparc=/usr/bin:/sbin:/usr/sbin:$(dir $(PERL))
#PATH=$(PATH.$(MACH))

#CFLAGS_i386 = -mtune=opteron -march=opteron
#CFLAGS_sparc = -mtune=ultrasparc -mcpu=ultrasparc -mno-unaligned-doubles
CFLAGS := -g -O2 
#CFLAGS += $(CFLAGS_$(MACH))
CFLAGS_FOR_BUILD=$(CFLAGS)

CXXFLAGS := -g -O2
#CXXFLAGS += $(CFLAGS_$(MACH))

# CC_BITS may get in the way
CC_BITS=

# LD_OPTIONS
# /usr/lib/ld/map.noexbss  destroys SPARC
# /usr/lib/ld/map.noexdata destroys Intel
GCC_LD_OPTIONS.sparc=-M /usr/lib/ld/map.noexstk -M /usr/lib/ld/map.pagealign -z ignore
GCC_LD_OPTIONS.i386=-M /usr/lib/ld/map.noexstk -M /usr/lib/ld/map.pagealign -z ignore
GCC_LD_OPTIONS = $(GCC_LD_OPTIONS.$(MACH))
LD_OPTIONS := $(GCC_LD_OPTIONS)

CONFIG_SHELL = /bin/sh
MAKESHELL = /bin/sh

CONFIGURE_PREFIX = /usr/gcc/4.8

CONFIGURE_OPTIONS += --infodir=$(CONFIGURE_PREFIX)/share/info
CONFIGURE_OPTIONS += --libexecdir=$(CONFIGURE_PREFIX)/lib
CONFIGURE_OPTIONS += --enable-languages="c,c++,fortran,objc"
CONFIGURE_OPTIONS += --enable-shared
CONFIGURE_OPTIONS += --enable-targets=$(GNU_ARCH_64)
CONFIGURE_OPTIONS += --without-gnu-ld --with-ld=/usr/bin/ld

CONFIGURE_ENV     += LD_OPTIONS="$(LD_OPTIONS)"

# sparc and x86 use different assemblers
CONFIGURE_OPTIONS.sparc +=	--without-gnu-as --with-as=/usr/bin/as
CONFIGURE_OPTIONS.i386 +=	--with-gnu-as --with-as=/usr/bin/gas
CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(MACH))

#COMPONENT_BUILD_ENV += PATH="$(PATH)"
COMPONENT_BUILD_ENV += SHELL="$(CONFIG_SHELL)"
COMPONENT_BUILD_ENV += MAKESHELL="$(MAKESHELL)"

COMPONENT_BUILD_TARGETS=bootstrap

#COMPONENT_POST_INSTALL_ACTION = \
#    ( cd $(PROTOUSRDIR)/gcc/4.8/lib  ; \
#	$(PYTHON) -m compileall . ; \
#      cd $(PROTOUSRDIR)/gcc/4.8/lib/$(MACH64) ; \
#	$(PYTHON) -m compileall . ; \
#      cd $(PROTOUSRDIR)/gcc/4.8/share/gcc-4.8.2/python/libstdcxx ; \
#	$(PYTHON) -m compileall . ; \
#      cd $(PROTOUSRDIR)/gcc/4.8/share/gcc-4.8.2/python/libstdcxx/v6 ; \
#	$(PYTHON) -m compileall . )

build:		$(BUILD_32)

install:	$(INSTALL_32)

# To ensure that all tests that are expected to pass actually
# pass, we have to increase the stacksize limit to at least 
# 16384 Kb. Otherwise we'll get spurious failures in the test
# harness (gcc.c-torture/compile/limits-exprparen.c and others).
# With the soft stacksize limit set to 16384 we get very good
# test results.
test:
	( cd $(BUILD_DIR_32)/gcc ; \
	    ulimit -Ss 16384 ; \
	    env - LD_OPTIONS=$(LD_OPTIONS) $(GMAKE) -k -i check ; \
	    cd $(BUILD_DIR_32) ; \
	    env - LD_OPTIONS=$(LD_OPTIONS) $(GMAKE) -k -i check-target )

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
