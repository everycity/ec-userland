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
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved.
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

ECPREFIX=/ec

PATH=$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin

# Default to looking for source archives on the internal mirror before we
# hammer on the external repositories.
export DOWNLOAD_SEARCH_PATH ?=	http://dlc.openindiana.org/s10-userland/source-archives

# The workspace starts at the mercurial root
export WS_TOP ?=		$(shell hg root)

WS_LOGS =	$(WS_TOP)/$(MACH)/logs
WS_REPO =	$(WS_TOP)/$(MACH)/repo
WS_TOOLS =	$(WS_TOP)/tools
WS_MAKE_RULES =	$(WS_TOP)/make-rules
WS_COMPONENTS =	$(WS_TOP)/components
WS_INCORPORATIONS =	$(WS_TOP)/incorporations
WS_LINT_CACHE =	$(WS_TOP)/$(MACH)/pkglint-cache

USERLAND_ARCHIVES =	$(WS_TOP)/archives

# we want our pkg piplines to fail if there is an error
# (like if pkgdepend fails in the middle of a pipe), but
# we don't want the builds or ./configure's failing as well.
# so we only set pipefail for the publish target and have
# to reset it for the others since they might be invoked
# as dependencies of publish.
export SHELLOPTS
build:		SHELLOPTS=
test:		SHELLOPTS=
install:	SHELLOPTS=
publish:	SHELLOPTS=pipefail

SHELL=	/bin/bash

CONSOLIDATION =	openwebstack
PUBLISHER ?=	$(CONSOLIDATION)

ROOT =			/

OS_VERSION =		$(shell uname -r)
SOLARIS_VERSION =	$(OS_VERSION:5.%=2.%)

COMPILER =		gcc
BITS =			32
PYTHON_VERSION =	2.6
PYTHON_VERSIONS =	2.6

BASS_O_MATIC =	$(WS_TOOLS)/bass-o-matic

CLONEY =	$(WS_TOOLS)/cloney

CONFIG_SHELL =	/bin/bash

PKG_REPO =	file:$(WS_REPO)

COMPONENT_DIR =	$(shell pwd)
SOURCE_DIR =	$(COMPONENT_DIR)/source/$(COMPONENT_SRC)
BUILD_DIR =	$(COMPONENT_DIR)/build
PROTO_DIR =	$(BUILD_DIR)/prototype/$(MACH)

ETCDIR =	/etc
USRDIR =	/usr
BINDIR =	/bin
SBINDIR =	/sbin
LIBDIR =	/lib
USRBINDIR =	$(USRDIR)/bin
USRSBINDIR =	$(USRDIR)/sbin
USRLIBDIR =	$(USRDIR)/lib
USRSHAREDIR =	$(USRDIR)/share
USRINCDIR =	$(USRDIR)/include
USRSHARELOCALEDIR =	$(USRSHAREDIR)/locale
USRSHAREMANDIR =	$(USRSHAREDIR)/man
USRSHAREDOCDIR =	$(USRSHAREDIR)/doc
USRSHARELIBDIR =	$(USRSHAREDIR)/lib
USRSHAREMAN1DIR =	$(USRSHAREMANDIR)/man1
USRSHAREMAN1MDIR =	$(USRSHAREMANDIR)/man1m
USRSHAREMAN3DIR =	$(USRSHAREMANDIR)/man3
USRSHAREMAN4DIR =	$(USRSHAREMANDIR)/man4
USRSHAREMAN5DIR =	$(USRSHAREMANDIR)/man5
USRLIBDIR64 =	$(USRDIR)/lib/$(MACH64)
PROTOBINDIR =	$(PROTO_DIR)/$(BINDIR)
PROTOETCDIR =	$(PROTO_DIR)/$(ETCDIR)
PROTOETCSECDIR = $(PROTO_DIR)/$(ETCDIR)/security
PROTOUSRDIR =	$(PROTO_DIR)/$(USRDIR)
PROTOLIBDIR =	$(PROTO_DIR)/$(LIBDIR)
PROTOUSRBINDIR =	$(PROTO_DIR)/$(USRBINDIR)
PROTOUSRSBINDIR =	$(PROTO_DIR)/$(USRSBINDIR)
PROTOUSRLIBDIR =	$(PROTO_DIR)/$(USRLIBDIR)
PROTOUSRLIBDIR64 =	$(PROTO_DIR)/$(USRLIBDIR64)
PROTOUSRINCDIR =	$(PROTO_DIR)/$(USRINCDIR)
PROTOUSRSHAREDIR =	$(PROTO_DIR)/$(USRSHAREDIR)
PROTOUSRSHARELIBDIR =	$(PROTO_DIR)/$(USRSHARELIBDIR)
PROTOUSRSHAREMANDIR =	$(PROTO_DIR)/$(USRSHAREMANDIR)
PROTOUSRSHAREDOCDIR =	$(PROTO_DIR)/$(USRSHAREDOCDIR)
PROTOUSRSHAREMAN1DIR =	$(PROTO_DIR)/$(USRSHAREMAN1DIR)
PROTOUSRSHAREMAN1MDIR =	$(PROTO_DIR)/$(USRSHAREMAN1MDIR)
PROTOUSRSHAREMAN3DIR =	$(PROTO_DIR)/$(USRSHAREMAN3DIR)
PROTOUSRSHAREMAN4DIR =	$(PROTO_DIR)/$(USRSHAREMAN4DIR)
PROTOUSRSHAREMAN5DIR =	$(PROTO_DIR)/$(USRSHAREMAN5DIR)
PROTOUSRSHARELOCALEDIR =	$(PROTO_DIR)/$(USRSHARELOCALEDIR)


SFWBIN =	/usr/sfw/bin
SFWINCLUDE =	/usr/sfw/include
SFWLIB =	/usr/sfw/lib
SFWLIB64 =	/usr/sfw/lib/$(MACH64)
SFWSHARE =	/usr/sfw/share
SFWSHAREMAN =	/usr/sfw/share/man
SFWSHAREMAN1 =	/usr/sfw/share/man/man1
PROTOSFWBIN =	$(PROTO_DIR)/$(SFWBIN)
PROTOSFWLIB =	$(PROTO_DIR)/$(SFWLIB)
PROTOSFWLIB64 =	$(PROTO_DIR)/$(SFWLIB64)
PROTOSFWSHARE =	$(PROTO_DIR)/$(SFWSHARE)
PROTOSFWSHAREMAN =	$(PROTO_DIR)/$(SFWSHAREMAN)
PROTOSFWSHAREMAN1 =	$(PROTO_DIR)/$(SFWSHAREMAN1)
PROTOSFWINCLUDE =	$(PROTO_DIR)/$(SFWINCLUDE)

GNUBIN =	/usr/gnu/bin
GNULIB =	/usr/gnu/lib
GNULIB64 =	/usr/gnu/lib/$(MACH64)
GNUSHARE =	/usr/gnu/share
GNUSHAREMAN =	/usr/gnu/share/man
GNUSHAREMAN1 =	/usr/gnu/share/man/man1
PROTOGNUBIN =	$(PROTO_DIR)/$(GNUBIN)
PROTOGNUSHARE =	$(PROTO_DIR)/$(GNUSHARE)
PROTOGNUSHAREMAN =	$(PROTO_DIR)/$(GNUSHAREMAN)
PROTOGNUSHAREMAN1 =	$(PROTO_DIR)/$(GNUSHAREMAN1)

# work around _TIME, _DATE, embedded date chatter in component builds
# to use, set TIME_CONSTANT in the component Makefile and add $(CONSTANT_TIME)
# to the appropriate {CONFIGURE|BUILD|INSTALL}_ENV
CONSTANT_TIME =		LD_PRELOAD_32=$(WS_TOOLS)/time-$(MACH32).so
CONSTANT_TIME +=	LD_PRELOAD_64=$(WS_TOOLS)/time-$(MACH64).so
CONSTANT_TIME +=	TIME_CONSTANT=$(TIME_CONSTANT)

# set MACH from uname -p to either sparc or i386
MACH =		$(shell uname -p)

# set MACH32 from MACH to either sparcv7 or i86
MACH32_1 =	$(MACH:sparc=sparcv7)
MACH32 =	$(MACH32_1:i386=i86)

# set MACH64 from MACH to either sparcv9 or amd64
MACH64_1 =	$(MACH:sparc=sparcv9)
MACH64 =	$(MACH64_1:i386=amd64)

PLAT_1 =	$(MACH:sparc=sun)
PLAT =		$(PLAT_1:i386=pc)

CONFIGURE_32 =		$(BUILD_DIR_32)/.configured
CONFIGURE_64 =		$(BUILD_DIR_64)/.configured

BUILD_DIR_32 =		$(BUILD_DIR)/$(MACH32)
BUILD_DIR_64 =		$(BUILD_DIR)/$(MACH64)

BUILD_32 =		$(BUILD_DIR_32)/.built
BUILD_64 =		$(BUILD_DIR_64)/.built
BUILD_32_and_64 =	$(BUILD_32) $(BUILD_64)
$(BUILD_DIR_32)/.built:		BITS=32
$(BUILD_DIR_64)/.built:		BITS=64

INSTALL_32 =		$(BUILD_DIR_32)/.installed
INSTALL_64 =		$(BUILD_DIR_64)/.installed
INSTALL_32_and_64 =	$(INSTALL_32) $(INSTALL_64)
$(BUILD_DIR_32)/.installed:       BITS=32
$(BUILD_DIR_64)/.installed:       BITS=64

# set the default target for installation of the component
COMPONENT_INSTALL_TARGETS =	install

TEST_32 =		$(BUILD_DIR_32)/.tested
TEST_64 =		$(BUILD_DIR_64)/.tested
TEST_32_and_64 =	$(TEST_32) $(TEST_64)
$(BUILD_DIR_32)/.tested:       BITS=32
$(BUILD_DIR_64)/.tested:       BITS=64

# set the default target for test of the component
COMPONENT_TEST_TARGETS =	check

# BUILD_TOOLS is the root of all tools not normally installed on the system.
BUILD_TOOLS =	/ws/onnv-tools

SPRO_ROOT =	$(BUILD_TOOLS)/SUNWspro
SPRO_VROOT =	$(SPRO_ROOT)/sunstudio12.1

GCC_ROOT =	$(ECPREFIX)

CC.studio.32 =	$(SPRO_VROOT)/bin/cc
CXX.studio.32 =	$(SPRO_VROOT)/bin/CC

CC.studio.64 =	$(SPRO_VROOT)/bin/cc
CXX.studio.64 =	$(SPRO_VROOT)/bin/CC

CC.gcc.32 =	$(GCC_ROOT)/bin/gcc
CXX.gcc.32 =	$(GCC_ROOT)/bin/g++

CC.gcc.64 =	$(GCC_ROOT)/bin/gcc -m64
CXX.gcc.64 =	$(GCC_ROOT)/bin/g++ -m64

CC =		$(CC.$(COMPILER).$(BITS))
CXX =		$(CXX.$(COMPILER).$(BITS))

lint.32 =	$(SPRO_VROOT)/bin/lint -m32
lint.64 =	$(SPRO_VROOT)/bin/lint -m64

LINT =		$(lint.$(BITS))

LD =		/usr/ccs/bin/ld

PYTHON_VENDOR_PACKAGES.32 = /usr/lib/python$(PYTHON_VERSION)/vendor-packages
PYTHON_VENDOR_PACKAGES.64 = /usr/lib/python$(PYTHON_VERSION)/vendor-packages/64
PYTHON_VENDOR_PACKAGES = $(PYTHON_VENDOR_PACKAGES.$(BITS))

PYTHON.2.6.32 =	$(ECPREFIX)/bin/python2.6
PYTHON.2.6.64 =	$(ECPREFIX)/bin/$(MACH64)/python2.6

PYTHON.32 =	$(PYTHON.$(PYTHON_VERSION).$(BITS))
PYTHON.64 =	$(PYTHON.$(PYTHON_VERSION).$(BITS))
PYTHON =	$(PYTHON.$(PYTHON_VERSION).$(BITS))

# The default is site-packages, but that directory belongs to the end-user.
# Modules which are shipped by the OS but not with the core Python distribution
# belong in vendor-packages.
PYTHON_LIB= /usr/lib/python$(PYTHON_VERSION)/vendor-packages

JAVA_HOME =	$(ECPREFIX)/java

PERL =		$(ECPREFIX)/bin/perl

PERL_ARCH =     $(shell $(PERL) -e 'use Config; print $$Config{archname}')
# Optimally we should ask perl which C compiler was used but it doesn't
# result in a full path name.  Only "c" is being recorded
# inside perl builds while we actually need a full path to
# the studio compiler.
#PERL_CC =      $(shell $(PERL) -e 'use Config; print $$Config{cc}')
PERL_OPTIMIZE = $(shell $(PERL) -e 'use Config; print $$Config{optimize}')

PKG_MACROS +=   PERL_ARCH=$(PERL_ARCH)
PKG_MACROS +=   PERL_VERSION=$(PERL_VERSION)

CCSMAKE =	/usr/ccs/bin/make
GMAKE =		$(ECPREFIX)/bin/make
GPATCH =	$(ECPREFIX)/bin/patch
PATCH_LEVEL =	1
GPATCH_BACKUP =	--backup --version-control=numbered
GPATCH_FLAGS =	-p$(PATCH_LEVEL) $(GPATCH_BACKUP)
GSED =		$(ECPREFIX)/bin/sed

PKGREPO =	pkgrepo
PKGSEND =	pkgsend
PKGLINT =	pkglint

ACLOCAL =	/ec/bin/aclocal-1.10
AUTOMAKE =	/ec/bin/automake-1.10
AUTORECONF = 	/ec/bin/autoreconf

TOUCH =		$(ECPREFIX)/bin/touch
MKDIR =		/bin/mkdir -p
RM =		/bin/rm -f
CP =		/bin/cp -f
MV =		/bin/mv -f
LN =		/bin/ln
SYMLINK =	/bin/ln -s
ENV =		/usr/bin/env
INSTALL =	$(ECPREFIX)/bin/install
CHMOD =		/usr/bin/chmod
NAWK =		/usr/bin/nawk
TEE =		/usr/bin/tee


INS.dir=        $(INSTALL) -d $@
INS.file=       $(INSTALL) -m 444 $< $(@D)

PKG_CONFIG_PATH.32 = $(ECPREFIX)/bin//pkgconfig
PKG_CONFIG_PATH.64 = $(ECPREFIX)/bin/$(MACH64)/pkgconfig
PKG_CONFIG_PATH = PKG_CONFIG_PATH.$(BITS)


#
# C preprocessor flag sets to ease feature selection.  Add the required
# feature to your Makefile with CPPFLAGS += $(FEATURE_MACRO) and add to
# the component build with CONFIGURE_OPTIONS += CPPFLAGS="$(CPPFLAGS)" or
# similiar.
#

# Enables visibility of some c99 math functions that aren't visible by default.
# What other side-effects are there?
CPP_C99_EXTENDED_MATH =	-D_STDC_99

# Enables large file support for components that have no other means of doing
# so.  Use CPP_LARGEFILES and not the .32/.64 variety directly
CPP_LARGEFILES.32 =	$(shell getconf LFS_CFLAGS)
CPP_LARGEFILES.64 =	$(shell getconf LFS64_CFLAGS)
CPP_LARGEFILES =		$(CPP_LARGEFILES.$(BITS))

# Enables some #pragma redefine_extname to POSIX-compliant Standard C Library
# functions. Also avoids the component's #define _POSIX_C_SOURCE to some value
# we currently do not support.
CPP_POSIX =	-D_POSIX_C_SOURCE=200112L -D_POSIX_PTHREAD_SEMANTICS

# XPG6 mode.  This option enables XPG6 conformance, plus extensions.
# Amongst other things, this option will cause system calls like
# popen (3C) and system (3C) to invoke the standards-conforming
# shell, /usr/xpg4/bin/sh, instead of /usr/bin/sh.  Add studio_XPG6MODE to
# CFLAGS instead of using this directly
CPP_XPG6MODE=	-D_XOPEN_SOURCE=600 -D__EXTENSIONS__=1 -D_XPG6

# XPG5 mode. These options are specific for C++, where _XPG6,
# _XOPEN_SOURCE=600 and C99 are illegal. -D__EXTENSIONS__=1 is legal in C++.
CPP_XPG5MODE=   -D_XOPEN_SOURCE=500 -D__EXTENSIONS__=1 -D_XPG5

#
# Studio C compiler flag sets to ease feature selection.  Add the required
# feature to your Makefile with CFLAGS += $(FEATURE_MACRO) and add to the
# component build with CONFIGURE_OPTIONS += CFLAGS="$(CFLAGS)" or similiar.
#

# Generate 32/64 bit objects
CC_BITS =	-m$(BITS)

# Code generation instruction set and optimization 'hints'.  Use studio_XBITS
# and not the .arch.bits variety directly.
studio_XBITS.sparc.32 =	-xtarget=ultra2 -xarch=sparcvis -xchip=ultra2
studio_XBITS.sparc.64 =	-xtarget=ultra2 -xarch=sparcvis -xchip=ultra2
studio_XBITS.i386.32 =	-xchip=pentium
studio_XBITS.i386.64 =	-xchip=generic -Ui386 -U__i386
studio_XBITS = $(studio_XBITS.$(MACH).$(BITS))

# Turn on recognition of supported C99 language features and enable the 1999 C
# standard library semantics of routines that appear in	both the 1990 and
# 1999 C standard. To use set studio_C99MODE=$(studio_99_ENABLE) in your
# component Makefile.
studio_C99_ENABLE =		-xc99=all

# Turn off recognition of C99 language features, and do not enable the 1999 C
# standard library semantics of routines that appeared in both the 1990	and
# 1999 C standard.  To use set studio_C99MODE=$(studio_99_DISABLE) in your
# component Makefile.
studio_C99_DISABLE =	-xc99=none

# Use the compiler default 'xc99=all,no_lib'
studio_C99MODE =

# For C++, compatibility with C99 (which is technically illegal) is
# enabled in a different way. So, we must use a different macro for it.
studio_cplusplus_C99_ENABLE = 	-xlang=c99

# Turn it off.
studio_cplusplus_C99_DISABLE =

# And this is the macro you should actually use
studio_cplusplus_C99MODE = 

# Allow zero-sized struct/union declarations and void functions with return
# statements.
studio_FEATURES_EXTENSIONS =	-features=extensions

# Control the Studio optimization level.
studio_OPT.sparc.32 =	-xO4
studio_OPT.sparc.64 =	-xO4
studio_OPT.i386.32 =	-xO4
studio_OPT.i386.64 =	-xO4
studio_OPT =		$(studio_OPT.$(MACH).$(BITS))

# Studio PIC code generation.  Use CC_PIC instead to select PIC code generation.
studio_PIC = 	-KPIC -DPIC

# The Sun Studio 11 compiler has changed the behaviour of integer
# wrap arounds and so a flag is needed to use the legacy behaviour
# (without this flag panics/hangs could be exposed within the source).
# This is used through studio_IROPTS, not the 'sparc' variety.
studio_IROPTS.sparc =	-W2,-xwrap_int
studio_IROPTS =		$(studio_IROPTS.$(MACH))

# Control register usage for generated code.  SPARC ABI requires system
# libraries not to use application registers.  x86 requires 'no%frameptr' at
# x04 or higher.

# We should just use -xregs but we need to workaround 7030022. Note
# that we can't use the (documented) -Wc,-xregs workaround because
# libtool really hates -Wc and thinks it should be -Wl. Instead
# we use an (undocumented) option which actually happens to be what
# CC would use.
studio_XREGS.sparc =	-Qoption cg -xregs=no%appl
studio_XREGS.i386 =	-xregs=no%frameptr
studio_XREGS =		$(studio_XREGS.$(MACH))

gcc_XREGS.sparc =	-mno-app-regs
gcc_XREGS.i386 =
gcc_XREGS =		$(gcc_XREGS.$(MACH))

# Set data alignment on sparc to reasonable values, 8 byte alignment for 32 bit
# objects and 16 byte alignment for 64 bit objects.  This is added to CFLAGS by
# default.
studio_ALIGN.sparc.32 =	-xmemalign=8s
studio_ALIGN.sparc.64 =	-xmemalign=16s
studio_ALIGN =		$(studio_ALIGN.$(MACH).$(BITS))

# Studio shorthand for building multi-threaded code,  enables -D_REENTRANT and
# linking with threadin support.  This is added to CFLAGS by default, override
# studio_MT to turn this off.
studio_MT =		-mt

# See CPP_XPG6MODE comment above.
studio_XPG6MODE =	$(studio_C99MODE) $(CPP_XPG6MODE)
XPG6MODE =		$(studio_XPG6MODE)

# See CPP_XPG5MODE comment above. You can only use this in C++, not in C99.
studio_XPG5MODE =	$(studio_cplusplus_C99MODE) $(CPP_XPG5MODE)
XPG5MODE =		$(studio_XPG5MODE)

# Default Studio C compiler flags.  Add the required feature to your Makefile
# with CFLAGS += $(FEATURE_MACRO) and add to the component build with
# CONFIGURE_OPTIONS += CFLAGS="$(CFLAGS)" or similiar.  In most cases, it
# should not be necessary to add CFLAGS to any environment other than the
# configure environment.
CFLAGS.studio +=	$(studio_OPT) $(studio_XBITS) $(studio_XREGS) \
			$(studio_IROPTS) $(studio_C99MODE) $(studio_ALIGN) \
			$(studio_MT)

#
# GNU C compiler flag sets to ease feature selection.  Add the required
# feature to your Makefile with CFLAGS += $(FEATURE_MACRO) and add to the
# component build with CONFIGURE_OPTIONS += CFLAGS="$(CFLAGS)" or similiar.
#

# GCC Compiler optimization flag
gcc_OPT =	-O3

# GCC PIC code generation.  Use CC_PIC instead to select PIC code generation.
gcc_PIC =	-fPIC -DPIC

# Generic macro for PIC code generation.  Use this macro instead of the
# compiler specific variant.
CC_PIC =	$($(COMPILER)_PIC)


# Default GNU C compiler flags.  Add the required feature to your Makefile
# with CFLAGS += $(FEATURE_MACRO) and add to the component build with
# CONFIGURE_OPTIONS += CFLAGS="$(CFLAGS)" or similiar.  In most cases, it
# should not be necessary to add CFLAGS to any environment other than the
# configure environment.
CFLAGS.gcc +=	$(gcc_OPT)
CFLAGS.gcc +=	$(gcc_XREGS)


# Build 32 or 64 bit objects.
CFLAGS +=	$(CC_BITS)

# Add compiler specific 'default' features
CFLAGS +=	$(CFLAGS.$(COMPILER))


# Studio C++ requires -norunpath to avoid adding its location into the RUNPATH
# to C++ applications.
studio_NORUNPATH =	 -norunpath

# To link in standard mode (the default mode) without any C++ libraries
# (except libCrun), use studio_LIBRARY_NONE in your component Makefile.
studio_LIBRARY_NONE =	 -library=%none

# Don't link C++ with any C++ Runtime or Standard C++ library
studio_CXXLIB_NONE =	-xnolib

# Link C++ with the Studio C++ Runtime and Standard C++ library.  This is the
# default for "standard" mode.
studio_CXXLIB_CSTD =	-library=Cstd,Crun

# link C++ with the Studio  C++ Runtime and Apache Standard C++ library
studio_CXXLIB_APACHE =	-library=stdcxx4,Crun

# Add the C++ ABI compatibility flags for older ABI compatibility.  The default
# is "standard mode" (-compat=5)
studio_COMPAT_VERSION_4 =	-compat=4

# Tell the compiler that we don't want the studio runpath added to the
# linker flags.  We never want the Studio location added to the RUNPATH.
CXXFLAGS +=	$($(COMPILER)_NORUNPATH)

# Build 32 or 64 bit objects in C++ as well.
CXXFLAGS +=	$(CC_BITS)

#
# Solaris linker flag sets to ease feature selection.  Add the required
# feature to your Makefile with LDFLAGS += $(FEATURE_MACRO) and add to the
# component build with CONFIGURE_OPTIONS += LDFLAGS="$(LDFLAGS)" or similiar.
#

# set the bittedness that we want to link
LD_BITS =	-$(BITS)

ifndef CONFIGURE_PREFIX
CONFIGURE_PREFIX=	$(ECPREFIX)
endif

ifneq ($(CONFIGURE_PREFIX), $(ECPREFIX))
	CFLAGS +=	-I$(CONFIGURE_PREFIX)/include -I$(ECPREFIX)/include
	LDFLAGS.32 =	-L$(CONFIGURE_PREFIX)/lib -R$(CONFIGURE_PREFIX)/lib -L$(ECPREFIX)/lib -R$(ECPREFIX)/lib
	LDFLAGS.64 =	-m64 -L$(CONFIGURE_PREFIX)/lib/amd64 -R$(CONFIGURE_PREFIX)/lib/amd64 -L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64)
else
	CFLAGS +=	-I$(ECPREFIX)/include
	LDFLAGS.32 =	-L$(ECPREFIX)/lib -R$(ECPREFIX)/lib
	LDFLAGS.64 =	-m64 -L$(ECPREFIX)/lib/$(MACH64) -R$(ECPREFIX)/lib/$(MACH64)
endif

LDFLAGS =	$(LDFLAGS.$(BITS))

# Reduce the symbol table size, effectively conflicting with -g.  We should
# get linker guidance here.
LD_Z_REDLOCSYM =	-z redlocsym

# Cause the linker to rescan archive libraries and resolve remaining unresolved
# symbols recursively until all symbols are resolved.  Components should be
# linking in the libraries they need, in the required order.  This should
# only be required if the component's native build is horribly broken.
LD_Z_RESCAN_NOW =	-z rescan-now

LD_Z_TEXT =		-z direct

# make sure all symbols are defined.
LD_Z_DEFS =		-z defs

# eliminate unreferenced dynamic dependencies
LD_Z_IGNORE =		-z ignore

# use direct binding
LD_B_DIRECT =		-Bdirect

#
# More Solaris linker flags that we want to be sure that everyone gets.  This
# is automatically added to the calling environment during the 'build' and
# 'install' phases of the component build.  Each individual feature can be
# turned off by adding FEATURE_MACRO= to the component Makefile.
#

# Create a non-executable stack when linking.
LD_MAP_NOEXSTK.i386 =	-M /usr/lib/ld/map.noexstk
LD_MAP_NOEXSTK.sparc =	-M /usr/lib/ld/map.noexstk

# Create a non-executable bss segment when linking.
LD_MAP_NOEXBSS =	-M /usr/lib/ld/map.noexbss

# Create a non-executable data segment when linking.  Due to PLT needs, the
# data segment must be executable on sparc, but the bss does not.
# see mapfile comments for more information
LD_MAP_NOEXDATA.i386 =	-M /usr/lib/ld/map.noexdata
LD_MAP_NOEXDATA.sparc =	$(LD_MAP_NOEXBSS)

# Page alignment
LD_MAP_PAGEALIGN =	-M /usr/lib/ld/map.pagealign

# Linker options to add when only building libraries
LD_OPTIONS_SO +=	$(LD_Z_TEXT) $(LD_Z_DEFS)

# Default linker options that everyone should get.  Do not add additional
# libraries to this macro, as it will apply to everything linked during the
# component build.
LD_OPTIONS +=	$(LD_MAP_NOEXSTK.$(MACH)) $(LD_MAP_NOEXDATA.$(MACH)) \
		$(LD_MAP_PAGEALIGN) $(LD_B_DIRECT) $(LD_Z_IGNORE)

# Environment variables and arguments passed into the build and install
# environment(s).  These are the initial settings.
COMPONENT_BUILD_ENV= \
    LD_OPTIONS="$(LD_OPTIONS)"
COMPONENT_INSTALL_ENV= \
    LD_OPTIONS="$(LD_OPTIONS)"

# Add any bit-specific settings
COMPONENT_BUILD_ENV += $(COMPONENT_BUILD_ENV.$(BITS))
COMPONENT_BUILD_ARGS += $(COMPONENT_BUILD_ARGS.$(BITS))
COMPONENT_INSTALL_ENV += $(COMPONENT_INSTALL_ENV.$(BITS))
COMPONENT_INSTALL_ARGS += $(COMPONENT_INSTALL_ARGS.$(BITS))

# declare these phony so that we avoid filesystem conflicts.
.PHONY:	prep build install publish test clean clobber

# If there are no tests to execute
NO_TESTS =	test-nothing
test-nothing:
	@echo "There are no tests available at this time."
