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
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved.
# Copyright 2011-2013 EveryCity Ltd. All rights reserved.
#

COMPILER=	gcc
LINKER=		gcc
BITS=		32

# to use, set TIME_CONSTANT in the component Makefile and add $(CONSTANT_TIME)
# to the appropriate {CONFIGURE|BUILD|INSTALL}_ENV
CONSTANT_TIME=	LD_PRELOAD_32=$(WS_TOOLS)/time-$(MACH32).so
CONSTANT_TIME+=	LD_PRELOAD_64=$(WS_TOOLS)/time-$(MACH64).so
CONSTANT_TIME+=	TIME_CONSTANT=$(TIME_CONSTANT)

SPRO_ROOT=	$(BUILD_TOOLS)/SUNWspro
SPRO_VROOT=	$(SPRO_ROOT)/sunstudio12.1

GCC_VERSION=	4.8
GCC_ROOT=	$(USRDIR)/gcc/$(GCC_VERSION)

CC.studio.32=	$(SPRO_VROOT)/bin/cc
CXX.studio.32=	$(SPRO_VROOT)/bin/CC

CC.studio.64=	$(SPRO_VROOT)/bin/cc
CXX.studio.64=	$(SPRO_VROOT)/bin/CC

CC.gcc.32=	$(GCC_ROOT)/bin/gcc
CXX.gcc.32=	$(GCC_ROOT)/bin/g++

CC.gcc.64=	$(GCC_ROOT)/bin/gcc
CXX.gcc.64=	$(GCC_ROOT)/bin/g++

CC=		$(CC.$(COMPILER).$(BITS))
CXX=		$(CXX.$(COMPILER).$(BITS))

lint.32=	$(SPRO_VROOT)/bin/lint -m32
lint.64=	$(SPRO_VROOT)/bin/lint -m64

LINT=		$(lint.$(BITS))

LD=		/usr/bin/ld

# We need this, even in the case of /usr, as we don't know what
# the crle runpath is set to
#RELOC_INCLUDES=	-I$(INCDIR)
#RELOC_LDFLAGS=	-L$(LIBDIR) -R$(LIBDIR)

#CFLAGS+=	$(RELOC_INCLUDES)
#CXXFLAGS+=	$(RELOC_INCLUDES)
#CPPFLAGS+=	$(RELOC_INCLUDES)
#LDFLAGS+=	$(RELOC_LDFLAGS)

#
# C preprocessor flag sets to ease feature selection.  Add the required
# feature to your Makefile with CPPFLAGS += $(FEATURE_MACRO)
#

# Enables visibility of some c99 math functions that aren't visible by default.
# What other side-effects are there?
CPP_C99_EXTENDED_MATH=	-D_STDC_99

# Enables large file support for components that have no other means of doing
# so.  Use CPP_LARGEFILES and not the .32/.64 variety directly
CPP_LARGEFILES.32=	$(shell getconf LFS_CFLAGS)
CPP_LARGEFILES.64=	$(shell getconf LFS64_CFLAGS)
CPP_LARGEFILES=		$(CPP_LARGEFILES.$(BITS))

# Enables some #pragma redefine_extname to POSIX-compliant Standard C Library
# functions. Also avoids the component's #define _POSIX_C_SOURCE to some value
# we currently do not support.
CPP_POSIX=	-D_POSIX_C_SOURCE=200112L -D_POSIX_PTHREAD_SEMANTICS

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
# feature to your Makefile with CFLAGS += $(FEATURE_MACRO)
#

# Generate 32/64 bit objects
CC_BITS=	-m$(BITS)

# Code generation instruction set and optimization 'hints'.  Use studio_XBITS
# and not the .arch.bits variety directly.
studio_XBITS.sparc.32=	-xtarget=ultra2 -xarch=sparcvis -xchip=ultra2
studio_XBITS.sparc.64=	-xtarget=ultra2 -xarch=sparcvis -xchip=ultra2
studio_XBITS.i386.32=	-xchip=pentium
studio_XBITS.i386.64=	-xchip=generic -Ui386 -U__i386
studio_XBITS= $(studio_XBITS.$(MACH).$(BITS))

# Turn on recognition of supported C99 language features and enable the 1999 C
# standard library semantics of routines that appear in	both the 1990 and
# 1999 C standard. To use set studio_C99MODE=$(studio_99_ENABLE) in your
# component Makefile.
studio_C99_ENABLE=		-xc99=all
gcc_C99_ENABLE=			-std=c99
C99_ENABLE=$($(COMPILER)_C99_ENABLE)

# Turn off recognition of C99 language features, and do not enable the 1999 C
# standard library semantics of routines that appeared in both the 1990	and
# 1999 C standard.  To use set studio_C99MODE=$(studio_99_DISABLE) in your
# component Makefile.
studio_C99_DISABLE=		-xc99=none

# Use the compiler default 'xc99=all,no_lib'
studio_C99MODE=

# For C++, compatibility with C99 (which is technically illegal) is
# enabled in a different way. So, we must use a different macro for it.
studio_cplusplus_C99_ENABLE= 	-xlang=c99

# Turn it off.
studio_cplusplus_C99_DISABLE=

# And this is the macro you should actually use
studio_cplusplus_C99MODE= 

# Allow zero-sized struct/union declarations and void functions with return
# statements.
studio_FEATURES_EXTENSIONS=	-features=extensions

# Control the Studio optimization level.
studio_OPT.sparc.32=	-xO4
studio_OPT.sparc.64=	-xO4
studio_OPT.i386.32=	-xO4
studio_OPT.i386.64=	-xO4
studio_OPT=		$(studio_OPT.$(MACH).$(BITS))

# Studio PIC code generation.  Use CC_PIC instead to select PIC code generation.
studio_PIC= 	-KPIC -DPIC

# The Sun Studio 11 compiler has changed the behaviour of integer
# wrap arounds and so a flag is needed to use the legacy behaviour
# (without this flag panics/hangs could be exposed within the source).
# This is used through studio_IROPTS, not the 'sparc' variety.
studio_IROPTS.sparc=	-W2,-xwrap_int
studio_IROPTS=		$(studio_IROPTS.$(MACH))

# Control register usage for generated code.  SPARC ABI requires system
# libraries not to use application registers.  x86 requires 'no%frameptr' at
# x04 or higher.

# We should just use -xregs but we need to workaround 7030022. Note
# that we can't use the (documented) -Wc,-xregs workaround because
# libtool really hates -Wc and thinks it should be -Wl. Instead
# we use an (undocumented) option which actually happens to be what
# CC would use.
studio_XREGS.sparc=	-Qoption cg -xregs=no%appl
studio_XREGS.i386=	-xregs=no%frameptr
studio_XREGS=		$(studio_XREGS.$(MACH))

gcc_XREGS.sparc=	-mno-app-regs
gcc_XREGS.i386=
gcc_XREGS=		$(gcc_XREGS.$(MACH))

# Set data alignment on sparc to reasonable values, 8 byte alignment for 32 bit
# objects and 16 byte alignment for 64 bit objects.  This is added to CFLAGS by
# default.
studio_ALIGN.sparc.32=	-xmemalign=8s
studio_ALIGN.sparc.64=	-xmemalign=16s
studio_ALIGN=		$(studio_ALIGN.$(MACH).$(BITS))

# Studio shorthand for building multi-threaded code,  enables -D_REENTRANT and
# linking with threadin support.  This is added to CFLAGS by default, override
# studio_MT to turn this off.
studio_MT=		-mt

# See CPP_XPG6MODE comment above.
studio_XPG6MODE=	$(studio_C99MODE) $(CPP_XPG6MODE)
XPG6MODE=		$(studio_XPG6MODE)

# See CPP_XPG5MODE comment above. You can only use this in C++, not in C99.
studio_XPG5MODE=	$(studio_cplusplus_C99MODE) $(CPP_XPG5MODE)
XPG5MODE=		$(studio_XPG5MODE)

# Default Studio C compiler flags.  Add the required feature to your Makefile
# with CFLAGS += $(FEATURE_MACRO)
CFLAGS.studio+=	$(studio_OPT) $(studio_XBITS) $(studio_XREGS) \
			$(studio_IROPTS) $(studio_C99MODE) $(studio_ALIGN) \
			$(studio_MT)

#
# GNU C compiler flag sets to ease feature selection.  Add the required
# feature to your Makefile with CFLAGS += $(FEATURE_MACRO)
#

# GCC Compiler optimization flag
gcc_OPT=	-O3

# GCC PIC code generation.  Use CC_PIC instead to select PIC code generation.
gcc_PIC=	-fPIC -DPIC

# Generic macro for PIC code generation.  Use this macro instead of the
# compiler specific variant.
CC_PIC=	$($(COMPILER)_PIC)

# Add default gcc options to the CFLAGS
CFLAGS.gcc+=	$(gcc_OPT)
CFLAGS.gcc+=	$(gcc_XREGS)
CXXFLAGS.gcc+=	$(gcc_OPT)

# Build 32 or 64 bit objects.
CFLAGS+=	$(CC_BITS)
CXXFLAGS+=	$(CC_BITS)

# Studio C++ requires -norunpath to avoid adding its location into the RUNPATH
# to C++ applications.
studio_NORUNPATH=	-norunpath

# To link in standard mode (the default mode) without any C++ libraries
# (except libCrun), use studio_LIBRARY_NONE in your component Makefile.
studio_LIBRARY_NONE=	-library=%none

# Don't link C++ with any C++ Runtime or Standard C++ library
studio_CXXLIB_NONE=	-xnolib

# Link C++ with the Studio C++ Runtime and Standard C++ library.  This is the
# default for "standard" mode.
studio_CXXLIB_CSTD=	-library=Cstd,Crun

# link C++ with the Studio  C++ Runtime and Apache Standard C++ library
studio_CXXLIB_APACHE=	-library=stdcxx4,Crun

# Add the C++ ABI compatibility flags for older ABI compatibility.  The default
# is "standard mode" (-compat=5)
studio_COMPAT_VERSION_4=	-compat=4

# Tell the compiler that we don't want the studio runpath added to the
# linker flags.  We never want the Studio location added to the RUNPATH.
CXXFLAGS.studio+=	$(studio_NORUNPATH)

# Add compiler specific 'default' features
CFLAGS+=	$(CFLAGS.$(COMPILER))
CXXFLAGS+=	$(CXXFLAGS.$(COMPILER))

#
# Solaris linker flag sets to ease feature selection.  Add the required
# feature to your Makefile with LDFLAGS += $(FEATURE_MACRO)
#

# set the bittedness that we want to link
#ccs.ld.64=	-64
#gcc.ld.32=	-m32
#gcc.ld.64=	-m64
#LD_BITS=	$($(LINKER).ld.$(BITS))
#LDFLAGS+=	$(LD_BITS)

LDFLAGS+=	$(LDFLAGS.$(BITS))

# Reduce the symbol table size, effectively conflicting with -g.  We should
# get linker guidance here.
LD_Z_REDLOCSYM=	-z redlocsym

# Cause the linker to rescan archive libraries and resolve remaining unresolved
# symbols recursively until all symbols are resolved.  Components should be
# linking in the libraries they need, in the required order.  This should
# only be required if the component's native build is horribly broken.
LD_Z_RESCAN_NOW=	-z rescan-now

LD_Z_TEXT=		-z direct

# make sure all symbols are defined.
LD_Z_DEFS=		-z defs

# eliminate unreferenced dynamic dependencies
LD_Z_IGNORE=		-z ignore

# use direct binding
LD_B_DIRECT=		-Bdirect

#
# More Solaris linker flags that we want to be sure that everyone gets.  This
# is automatically added to the calling environment during the 'build' and
# 'install' phases of the component build.  Each individual feature can be
# turned off by adding FEATURE_MACRO= to the component Makefile.
#

# Create a non-executable stack when linking.
LD_MAP_NOEXSTK.i386=	-M /usr/lib/ld/map.noexstk
LD_MAP_NOEXSTK.sparc=	-M /usr/lib/ld/map.noexstk

# Create a non-executable bss segment when linking.
LD_MAP_NOEXBSS=	-M /usr/lib/ld/map.noexbss

# Create a non-executable data segment when linking.  Due to PLT needs, the
# data segment must be executable on sparc, but the bss does not.
# see mapfile comments for more information
LD_MAP_NOEXDATA.i386=	-M /usr/lib/ld/map.noexdata
LD_MAP_NOEXDATA.sparc=	$(LD_MAP_NOEXBSS)

# Page alignment
LD_MAP_PAGEALIGN=	-M /usr/lib/ld/map.pagealign

# Linker options to add when only building libraries
LD_OPTIONS_SO+=	$(LD_Z_TEXT) $(LD_Z_DEFS)

# Default linker options that everyone should get.  Do not add additional
# libraries to this macro, as it will apply to everything linked during the
# component build.
LD_OPTIONS+=	$(LD_MAP_NOEXSTK.$(MACH)) $(LD_MAP_NOEXDATA.$(MACH)) \
		$(LD_MAP_PAGEALIGN) $(LD_B_DIRECT) $(LD_Z_IGNORE)

# Environment variables and arguments passed into the build and install
# environment(s).  These are the initial settings.
COMPONENT_BUILD_ENV= \
    LD_OPTIONS="$(LD_OPTIONS)"
COMPONENT_INSTALL_ENV= \
    LD_OPTIONS="$(LD_OPTIONS)"

