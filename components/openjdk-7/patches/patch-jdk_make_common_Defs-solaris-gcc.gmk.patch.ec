$NetBSD: patch-jdk_make_common_Defs-solaris-gcc.gmk,v 1.1 2013/06/15 09:31:06 jperkin Exp $

GCC support.

--- jdk/make/common/Defs-solaris-gcc.gmk.orig	2013-03-11 12:55:10.407557389 +0000
+++ jdk/make/common/Defs-solaris-gcc.gmk
@@ -0,0 +1,504 @@
+#
+# Copyright (c) 1999, 2012, Oracle and/or its affiliates. All rights reserved.
+# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+#
+# This code is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License version 2 only, as
+# published by the Free Software Foundation.  Oracle designates this
+# particular file as subject to the "Classpath" exception as provided
+# by Oracle in the LICENSE file that accompanied this code.
+#
+# This code is distributed in the hope that it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# version 2 for more details (a copy is included in the LICENSE file that
+# accompanied this code).
+#
+# You should have received a copy of the GNU General Public License version
+# 2 along with this work; if not, write to the Free Software Foundation,
+# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
+# or visit www.oracle.com if you need additional information or have any
+# questions.
+#
+
+#
+# Makefile to specify compiler flags for programs and libraries
+# targeted to Solaris.  Should not contain any rules.
+#
+# WARNING: This file is shared with other workspaces. 
+#          So when it includes other files, it must use JDK_TOPDIR.
+#
+
+# Warning: the following variables are overriden by Defs.gmk. Set
+# values will be silently ignored:
+#   CFLAGS        (set $(OTHER_CFLAGS) instead)
+#   CPPFLAGS      (set $(OTHER_CPPFLAGS) instead)
+#   CXXFLAGS      (set $(OTHER_CXXFLAGS) instead)
+#   LDFLAGS       (set $(OTHER_LDFAGS) instead)
+#   LDLIBS        (set $(EXTRA_LIBS) instead)
+#   LDLIBS_COMMON (set $(EXTRA_LIBS) instead)
+
+# Get shared JDK settings
+include $(JDK_MAKE_SHARED_DIR)/Defs.gmk
+
+# Part of INCREMENTAL_BUILD mechanism.
+#   Compiler emits things like:  path/file.o: file.h
+#   We want something like: relative_path/file.o relative_path/file.d: file.h
+CC_DEPEND	 = -MM
+CC_DEPEND_FILTER = $(SED) -e 's!$*\.$(OBJECT_SUFFIX)!$(dir $@)& $(dir $@)$*.$(DEPEND_SUFFIX)!g'
+
+ifndef PLATFORM_SRC
+  PLATFORM_SRC = $(BUILDDIR)/../src/solaris
+endif # PLATFORM_SRC
+
+# Location of the various .properties files specific to Solaris platform
+ifndef PLATFORM_PROPERTIES
+  PLATFORM_PROPERTIES  = $(BUILDDIR)/../src/solaris/lib
+endif # PLATFORM_SRC
+
+# Platform specific closed sources
+ifndef OPENJDK
+  ifndef CLOSED_PLATFORM_SRC
+    CLOSED_PLATFORM_SRC = $(BUILDDIR)/../src/closed/solaris
+  endif
+endif
+
+# platform specific include files
+PLATFORM_INCLUDE_NAME = $(PLATFORM)
+PLATFORM_INCLUDE      = $(INCLUDEDIR)/$(PLATFORM_INCLUDE_NAME)
+
+# suffix used for make dependencies files.
+DEPEND_SUFFIX = d
+# The suffix applied to the library name for FDLIBM
+FDDLIBM_SUFFIX = a
+# The suffix applied to scripts (.bat for windows, nothing for unix)
+SCRIPT_SUFFIX =
+# CC compiler object code output directive flag value
+CC_OBJECT_OUTPUT_FLAG = -o #trailing blank required!
+CC_PROGRAM_OUTPUT_FLAG = -o #trailing blank required!
+
+# The Full Debug Symbols (FDS) default for VARIANT == OPT builds is
+# enabled with debug info files ZIP'ed to save space. For VARIANT !=
+# OPT builds, FDS is always enabled, after all a debug build without
+# debug info isn't very useful. The ZIP_DEBUGINFO_FILES option only has
+# meaning when FDS is enabled.
+#
+# If you invoke a build with FULL_DEBUG_SYMBOLS=0, then FDS will be
+# disabled for a VARIANT == OPT build.
+#
+# Note: Use of a different variable name for the FDS override option
+# versus the FDS enabled check is intentional (FULL_DEBUG_SYMBOLS
+# versus ENABLE_FULL_DEBUG_SYMBOLS). For auto build systems that pass
+# in options via environment variables, use of distinct variables
+# prevents strange behaviours. For example, in a VARIANT != OPT build,
+# the FULL_DEBUG_SYMBOLS environment variable will be 0, but the
+# ENABLE_FULL_DEBUG_SYMBOLS make variable will be 1. If the same
+# variable name is used, then different values can be picked up by
+# different parts of the build. Just to be clear, we only need two
+# variable names because the incoming option value can be overridden
+# in some situations, e.g., a VARIANT != OPT build.
+
+ADD_GNU_DEBUGLINK = $(ABS_BUILDTOOLBINDIR)/add_gnu_debuglink
+FIX_EMPTY_SEC_HDR_FLAGS = $(ABS_BUILDTOOLBINDIR)/fix_empty_sec_hdr_flags
+
+ifeq ($(VARIANT), OPT)
+  FULL_DEBUG_SYMBOLS ?= 1
+  ENABLE_FULL_DEBUG_SYMBOLS = $(FULL_DEBUG_SYMBOLS)
+else
+  # debug variants always get Full Debug Symbols (if available)
+  ENABLE_FULL_DEBUG_SYMBOLS = 1
+endif
+_JUNK_ := $(shell \
+  echo >&2 "INFO: ENABLE_FULL_DEBUG_SYMBOLS=$(ENABLE_FULL_DEBUG_SYMBOLS)")
+# since objcopy is optional, we set ZIP_DEBUGINFO_FILES later
+
+ifeq ($(ENABLE_FULL_DEBUG_SYMBOLS),1)
+  ifndef CROSS_COMPILE_ARCH
+    # Default OBJCOPY comes from GNU Binutils on Solaris:
+    DEF_OBJCOPY=/opt/local/bin/objcopy
+  else
+    # Assume objcopy is part of the cross-compilation toolkit
+    DEF_OBJCOPY=$(COMPILER_PATH)/objcopy
+  endif
+  OBJCOPY=$(shell test -x $(DEF_OBJCOPY) && echo $(DEF_OBJCOPY))
+  ifneq ($(ALT_OBJCOPY),)
+    _JUNK_ := $(shell echo >&2 "INFO: ALT_OBJCOPY=$(ALT_OBJCOPY)")
+    # disable .debuginfo support by setting ALT_OBJCOPY to a non-existent path
+    OBJCOPY=$(shell test -x $(ALT_OBJCOPY) && echo $(ALT_OBJCOPY))
+  endif
+
+  # Setting ENABLE_FULL_DEBUG_SYMBOLS=1 (and OBJCOPY) above enables the
+  # JDK build to import .debuginfo or .diz files from the HotSpot build.
+  # However, adding FDS support to the JDK build will occur in phases
+  # so a different make variable (LIBRARY_SUPPORTS_FULL_DEBUG_SYMBOLS
+  # and PROGRAM_SUPPORTS_FULL_DEBUG_SYMBOLS) is used to indicate that a
+  # particular library or program supports FDS.
+
+  ifeq ($(OBJCOPY),)
+    _JUNK_ := $(shell \
+      echo >&2 "INFO: no objcopy cmd found so cannot create .debuginfo files. You may need to set ALT_OBJCOPY.")
+    ENABLE_FULL_DEBUG_SYMBOLS=0
+  else
+    _JUNK_ := $(shell \
+      echo >&2 "INFO: $(OBJCOPY) cmd found so will create .debuginfo files.")
+
+    # Library stripping policies for .debuginfo configs:
+    #   all_strip - strips everything from the library
+    #   min_strip - strips most stuff from the library; leaves minimum symbols
+    #   no_strip  - does not strip the library at all
+    #
+    # Oracle security policy requires "all_strip". A waiver was granted on
+    # 2011.09.01 that permits using "min_strip" in the Java JDK and Java JRE.
+    #
+    # Currently, STRIP_POLICY is only used when Full Debug Symbols is enabled.
+    STRIP_POLICY ?= min_strip
+
+    _JUNK_ := $(shell \
+      echo >&2 "INFO: STRIP_POLICY=$(STRIP_POLICY)")
+
+    ZIP_DEBUGINFO_FILES ?= 1
+
+    _JUNK_ := $(shell \
+      echo >&2 "INFO: ZIP_DEBUGINFO_FILES=$(ZIP_DEBUGINFO_FILES)")
+  endif
+endif
+
+#
+# Default optimization
+#
+
+ifndef OPTIMIZATION_LEVEL
+  ifeq ($(PRODUCT), java)
+    OPTIMIZATION_LEVEL = HIGHER
+  else
+    OPTIMIZATION_LEVEL = LOWER
+  endif
+endif
+ifndef FASTDEBUG_OPTIMIZATION_LEVEL
+  FASTDEBUG_OPTIMIZATION_LEVEL = LOWER
+endif
+
+CC_OPT/NONE     = 
+CC_OPT/LOWER    = -O2
+CC_OPT/HIGHER   = -O3
+CC_OPT/HIGHEST  = -O3
+
+CC_OPT          = $(CC_OPT/$(OPTIMIZATION_LEVEL))
+
+# For all platforms, do not omit the frame pointer register usage. 
+#    We need this frame pointer to make it easy to walk the stacks.
+#    This should be the default on X86, but ia64 and amd64 may not have this
+#    as the default.
+CFLAGS_REQUIRED_amd64   += -m64 -fno-omit-frame-pointer -D_LITTLE_ENDIAN -I/ec/include
+LDFLAGS_COMMON_amd64    += -m64
+CFLAGS_REQUIRED_i586    += -m32 -fno-omit-frame-pointer -D_LITTLE_ENDIAN -I/ec/include
+LDFLAGS_COMMON_i586     += -m32
+CFLAGS_REQUIRED_ia64    += -m64 -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+CFLAGS_REQUIRED_sparcv9 += -m64 -mcpu=v9
+LDFLAGS_COMMON_sparcv9  += -m64 -mcpu=v9
+CFLAGS_REQUIRED_sparc   += -m32 -mcpu=v9
+LDFLAGS_COMMON_sparc    += -m32 -mcpu=v9
+CFLAGS_REQUIRED_arm     += -fsigned-char -D_LITTLE_ENDIAN
+CFLAGS_REQUIRED_ppc     += -fsigned-char -D_BIG_ENDIAN
+ifeq ($(ZERO_BUILD), true)
+  CFLAGS_REQUIRED       =  $(ZERO_ARCHFLAG)
+  ifeq ($(ZERO_ENDIANNESS), little)
+    CFLAGS_REQUIRED     += -D_LITTLE_ENDIAN
+  endif
+  LDFLAGS_COMMON        += $(ZERO_ARCHFLAG)
+else
+  CFLAGS_REQUIRED       =  $(CFLAGS_REQUIRED_$(ARCH))
+  LDFLAGS_COMMON        += $(LDFLAGS_COMMON_$(ARCH))
+endif
+
+# If this is a --hash-style=gnu system, use --hash-style=both
+#   The gnu .hash section won't work on some Linux systems like SuSE 10.
+_HAS_HASH_STYLE_GNU:=$(shell $(CC) -dumpspecs | $(GREP) -- '--hash-style=gnu')
+ifneq ($(_HAS_HASH_STYLE_GNU),)
+  LDFLAGS_HASH_STYLE = -Wl,--hash-style=both
+endif
+LDFLAGS_COMMON          += $(LDFLAGS_HASH_STYLE)
+
+#
+# Selection of warning messages
+#
+GCC_INHIBIT	= -Wno-unused -Wno-parentheses
+GCC_STYLE	= 
+GCC_WARNINGS	= -W -Wall $(GCC_STYLE) $(GCC_INHIBIT)
+
+#
+# Treat compiler warnings as errors, if warnings not allowed
+#
+ifeq ($(COMPILER_WARNINGS_FATAL),true)
+  GCC_WARNINGS += -Werror
+endif
+
+#
+# Misc compiler options
+#
+ifneq ($(ARCH),ppc)
+  CFLAGS_COMMON   = -fno-strict-aliasing
+endif 
+PIC_CODE_LARGE = -fPIC
+PIC_CODE_SMALL = -fpic
+GLOBAL_KPIC = $(PIC_CODE_LARGE)
+CFLAGS_COMMON   += $(GLOBAL_KPIC) $(GCC_WARNINGS)
+ifeq ($(ARCH), amd64)
+ CFLAGS_COMMON += -pipe
+endif
+
+# Linux 64bit machines use Dwarf2, which can be HUGE, have fastdebug use -g1
+DEBUG_FLAG = -g
+ifeq ($(FASTDEBUG), true)
+  ifeq ($(ARCH_DATA_MODEL), 64)
+    DEBUG_FLAG = -g1
+  endif
+endif
+
+# DEBUG_BINARIES overrides everything, use full -g debug information
+ifeq ($(DEBUG_BINARIES), true)
+  DEBUG_FLAG = -g
+  CFLAGS_REQUIRED += $(DEBUG_FLAG)
+endif
+
+# If Full Debug Symbols is enabled, then we want the same debug and
+# optimization flags as used by FASTDEBUG.
+#
+ifeq ($(ENABLE_FULL_DEBUG_SYMBOLS),1)
+  ifeq ($(LIBRARY_SUPPORTS_FULL_DEBUG_SYMBOLS),1)
+    ifeq ($(VARIANT), OPT)
+      CC_OPT = $(DEBUG_FLAG) $(CC_OPT/$(FASTDEBUG_OPTIMIZATION_LEVEL))
+    endif
+  endif
+endif
+
+CFLAGS_OPT      = $(CC_OPT)
+CFLAGS_DBG      = $(DEBUG_FLAG)
+CFLAGS_COMMON += $(CFLAGS_REQUIRED)
+
+CXXFLAGS_COMMON = $(GLOBAL_KPIC) -DCC_NOEX $(GCC_WARNINGS)
+CXXFLAGS_OPT	= $(CC_OPT)
+CXXFLAGS_DBG	= $(DEBUG_FLAG)
+CXXFLAGS_COMMON += $(CFLAGS_REQUIRED)
+
+# FASTDEBUG: Optimize the code in the -g versions, gives us a faster debug java
+ifeq ($(FASTDEBUG), true)
+  CFLAGS_DBG    += $(CC_OPT/$(FASTDEBUG_OPTIMIZATION_LEVEL))
+  CXXFLAGS_DBG	+= $(CC_OPT/$(FASTDEBUG_OPTIMIZATION_LEVEL))
+endif
+
+CPP_ARCH_FLAGS = -DARCH='"$(ARCH)"'
+
+# Alpha arch does not like "alpha" defined (potential general arch cleanup issue here)
+ifneq ($(ARCH),alpha)
+  CPP_ARCH_FLAGS += -D$(ARCH)
+else
+  CPP_ARCH_FLAGS += -D_$(ARCH)_
+endif
+
+CPPFLAGS_COMMON = $(CPP_ARCH_FLAGS) -D__solaris__ $(VERSION_DEFINES) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE -D_REENTRANT
+
+ifeq ($(ARCH_DATA_MODEL), 64)
+CPPFLAGS_COMMON += -D_LP64=1
+endif
+
+CPPFLAGS_OPT    = -DNDEBUG
+CPPFLAGS_DBG    = -DDEBUG
+ifneq ($(PRODUCT), java)
+  CPPFLAGS_DBG    += -DLOGGING 
+endif
+
+ifdef LIBRARY
+  # Libraries need to locate other libraries at runtime, and you can tell
+  #   a library where to look by way of the dynamic runpaths (RPATH or RUNPATH)
+  #   buried inside the .so. The $ORIGIN says to look relative to where
+  #   the library itself is and it can be followed with relative paths from
+  #   that. By default we always look in $ORIGIN, optionally we add relative
+  #   paths if the Makefile sets LD_RUNPATH_EXTRAS to those relative paths.
+  #   On Linux we add a flag -z origin, not sure if this is necessary, but 
+  #   doesn't seem to hurt.
+  #   The environment variable LD_LIBRARY_PATH will over-ride these runpaths.
+  #   Try: 'readelf -d lib*.so' to see these settings in a library.
+  #
+ifndef USE_GCC
+  Z_ORIGIN_FLAG/sparc = -Xlinker -z -Xlinker origin
+  Z_ORIGIN_FLAG/i586  = -Xlinker -z -Xlinker origin
+  Z_ORIGIN_FLAG/amd64 = -Xlinker -z -Xlinker origin 
+  Z_ORIGIN_FLAG/ia64  = -Xlinker -z -Xlinker origin
+  Z_ORIGIN_FLAG/arm   = 
+  Z_ORIGIN_FLAG/ppc   =
+  Z_ORIGIN_FLAG/zero  = -Xlinker -z -Xlinker origin
+
+  LDFLAG_Z_ORIGIN = $(Z_ORIGIN_FLAG/$(ARCH_FAMILY))
+
+  LDFLAGS_COMMON += $(LDFLAG_Z_ORIGIN) -Xlinker -rpath -Xlinker \$$ORIGIN
+  LDFLAGS_COMMON += $(LD_RUNPATH_EXTRAS:%=$(LDFLAG_Z_ORIGIN) -Xlinker -rpath -Xlinker \$$ORIGIN/%)
+else
+  LDFLAGS_COMMON += -Wl,-R${PREFIX}/lib
+  LDFLAGS_COMMON += -Wl,-R${PREFIX}/jdk/instances/openjdk1.7.0/jre/lib/$(LIBARCH)
+  LDFLAGS_COMMON += -Wl,-R${PREFIX}/jdk/instances/openjdk1.7.0/jre/lib/$(LIBARCH)/jli
+endif # USE_GCC
+endif # LIBRARY
+
+EXTRA_LIBS += -lc
+
+LDFLAGS_DEFS_OPTION  = -Xlinker -z -Xlinker defs
+LDFLAGS_COMMON  += $(LDFLAGS_DEFS_OPTION)
+
+#
+# -L paths for finding and -ljava
+#
+#LDFLAGS_OPT     = -Xlinker -O1
+LDFLAGS_OPT     = 
+LDFLAGS_COMMON += -L$(LIBDIR)/$(LIBARCH)
+ifdef LIBRARY
+LDFLAGS_COMMON += -Wl,-soname=$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
+endif
+
+#
+# -static-libgcc is a gcc-3 flag to statically link libgcc, gcc-2.9x always
+# statically link libgcc but will print a warning with the flag. We don't 
+# want the warning, so check gcc version first.
+#
+ifeq ($(CC_MAJORVER),3)
+  OTHER_LDFLAGS  += -static-libgcc
+endif
+
+# Automatic precompiled header option to use (if COMPILE_APPROACH=batch)
+#   (See Rules.gmk) The gcc 5 compiler might have an option for this?
+AUTOMATIC_PCH_OPTION = 
+
+#
+# Post Processing of libraries/executables
+#
+ifeq ($(VARIANT), OPT)
+  ifneq ($(NO_STRIP), true)
+    ifneq ($(DEBUG_BINARIES), true)
+      # Debug 'strip -g' leaves local function Elf symbols (better stack
+      # traces)
+      POST_STRIP_PROCESS = $(STRIP) -g
+    endif
+  endif
+endif
+
+#
+# Use: ld $(LD_MAPFILE_FLAG) mapfile *.o
+#
+# actually if linker = illumos
+ifeq ($(CC_VERSION),gcc)
+LD_MAPFILE_FLAG = -Xlinker -M -Xlinker
+else
+LD_MAPFILE_FLAG = -Xlinker --version-script -Xlinker
+#LD_MAPFILE_FLAG = -M
+endif
+
+#
+# Support for Quantify.
+#
+ifdef QUANTIFY
+QUANTIFY_CMD = quantify
+QUANTIFY_OPTIONS = -cache-dir=/tmp/quantify -always-use-cache-dir=yes
+LINK_PRE_CMD = $(QUANTIFY_CMD) $(QUANTIFY_OPTIONS)
+endif
+
+#
+# Path and option to link against the VM, if you have to.  Note that
+# there are libraries that link against only -ljava, but they do get
+# -L to the -ljvm, this is because -ljava depends on -ljvm, whereas
+# the library itself should not.
+#
+VM_NAME         = server
+JVMLIB          = -L$(LIBDIR)/$(LIBARCH)/$(VM_NAME) -Wl,-R${PREFIX}/jdk/instances/openjdk1.7.0/jre/lib/$(LIBARCH)/$(VM_NAME) -ljvm
+JAVALIB         = -ljava $(JVMLIB)
+
+#
+# We want to privatize JVM symbols on Solaris. This is so the user can
+# write a function called FindClass and this should not override the 
+# FindClass that is inside the JVM. At this point in time we are not
+# concerned with other JNI libraries because we hope that there will
+# not be as many clashes there.
+#
+PRIVATIZE_JVM_SYMBOLS = false
+
+#USE_PTHREADS = true
+#override ALT_CODESET_KEY         = _NL_CTYPE_CODESET_NAME
+override AWT_RUNPATH             =
+#override HAVE_ALTZONE            = false
+#override HAVE_FILIOH             = false
+#override HAVE_GETHRTIME          = false
+#override HAVE_GETHRVTIME         = false
+#override HAVE_SIGIGNORE          = true
+#override LEX_LIBRARY             = -lfl
+ifeq ($(STATIC_CXX),true)
+override LIBCXX                  = -Wl,-Bstatic -lstdc++ -lgcc -Wl,-Bdynamic
+else
+override LIBCXX                  = -lstdc++
+endif
+#override LIBPOSIX4               =
+override LIBM                    = /usr/lib$(ISA_DIR)/libm.so.2
+override LIBSOCKET               = -lsocket
+override LIBNSL                  = -lnsl
+override LIBSCF                  = -lscf
+#override LIBTHREAD               =
+override LIBDL                   = -ldl
+#override MOOT_PRIORITIES         = true
+#override NO_INTERRUPTIBLE_IO     = true
+override OPENWIN_HOME            = /usr/X11
+override OPENWIN_LIB             = $(OPENWIN_HOME)/lib$(ISA_DIR)
+override OTHER_M4FLAGS           = -D__GLIBC__ -DGNU_ASSEMBLER
+#override SUN_CMM_SUBDIR          =
+override THREADS_FLAG            = native
+#override USE_GNU_M4              = true
+override USING_GNU_TAR           = true
+#override WRITE_LIBVERSION        = false
+
+# assuming that solaris && gcc equals a system with modular X11 header location
+ifeq ($(PLATFORM), solaris)
+  ifeq ($(CC_VERSION), gcc)
+    OTHER_CPPFLAGS += -I$(OPENWIN_HOME)/include
+  endif # CC_VERSION
+endif # PLATFORM
+
+# USE_EXECNAME forces the launcher to look up argv[0] on $PATH, and put the
+# resulting resolved absolute name of the executable in the environment
+# variable EXECNAME.  That executable name is then used that to locate the
+# installation area.
+#override USE_EXECNAME            = true
+
+# If your platform has DPS, it will have Type1 fonts too, in which case
+# it is best to enable DPS support until such time as 2D's rasteriser
+# can fully handle Type1 fonts in all cases. Default is "yes".
+# HAVE_DPS should only be "no" if the platform has no DPS headers or libs
+# DPS (Displayable PostScript) is available on Solaris machines
+HAVE_DPS = no
+
+SYSTEM_ZLIB = true
+
+#
+# Japanese manpages
+#
+JA_SOURCE_ENCODING = eucJP
+JA_TARGET_ENCODINGS = UTF-8
+
+# Settings for the JDI - Serviceability Agent binding.
+HOTSPOT_SALIB_PATH   = $(HOTSPOT_IMPORT_PATH)/jre/lib/$(LIBARCH)
+SALIB_NAME = $(LIB_PREFIX)saproc.$(LIBRARY_SUFFIX)
+SA_DEBUGINFO_NAME = $(LIB_PREFIX)saproc.debuginfo
+SA_DIZ_NAME = $(LIB_PREFIX)saproc.diz
+
+# The JDI - Serviceability Agent binding is not currently supported
+# on Linux-ia64.
+#ifeq ($(ARCH), ia64)
+#  INCLUDE_SA = false
+#else
+  INCLUDE_SA = true
+#endif
+
+ifdef CROSS_COMPILE_ARCH
+  # X11 headers are not under /usr/include
+  OTHER_CFLAGS += -I$(OPENWIN_HOME)/include
+  OTHER_CXXFLAGS += -I$(OPENWIN_HOME)/include
+  OTHER_CPPFLAGS += -I$(OPENWIN_HOME)/include
+endif
