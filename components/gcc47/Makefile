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
# Copyright 2011-2013 EveryCity Ltd. All rights reserved.
#
CONFIGURE_DEFAULT_ENV=no
CONFIGURE_DEFAULT_SHAREDLIB=no
CONFIGURE_DEFAULT_LDFLAGS = no
CONFIGURE_DEFAULT_CPPFLAGS = no

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gcc
COMPONENT_FMRI=		developer/compiler/gcc-47
COMPONENT_MJR_VERSION=	4.7
COMPONENT_MNR_VERSION=	3
COMPONENT_VERSION=	$(COMPONENT_MJR_VERSION).$(COMPONENT_MNR_VERSION)
COMPONENT_LICENSE=	GPLv2 LGPLv2.1 GPLv3 LGPLv3 GCC
COMPONENT_PROJECT_URL=	http://gcc.gnu.org/
COMPONENT_SUMMARY=	The GNU Compiler Collection
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:2f7c37eb4fc14422ff2358a9ef59c974a75ab41204ef0e49fc34ab1d8981a9c3
COMPONENT_ARCHIVE_URL=	http://ftp.gnu.org/gnu/gcc/$(COMPONENT_NAME)-$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/configure.mk
include $(WS_MAKE_RULES)/ips.mk

PATH=$(dir $(CC)):/usr/bin:$(dir $(PERL))

CFLAGS := -g -O2
CFLAGS_FOR_BUILD=$(CFLAGS)

CXXFLAGS := -g -O2
CC_BITS=

GCC_LD_OPTIONS.sparc=-M /usr/lib/ld/map.noexstk -M /usr/lib/ld/map.pagealign -z ignore
GCC_LD_OPTIONS.i386=-M /usr/lib/ld/map.noexstk -M /usr/lib/ld/map.pagealign -z ignore
GCC_LD_OPTIONS = $(GCC_LD_OPTIONS.$(MACH))
LD_OPTIONS := $(GCC_LD_OPTIONS)

CONFIG_SHELL = /bin/sh
MAKESHELL = /bin/sh

CONFIGURE_PREFIX = /usr/gcc/4.7

CONFIGURE_OPTIONS += --infodir=$(CONFIGURE_PREFIX)/share/info
CONFIGURE_OPTIONS += --libexecdir=$(CONFIGURE_PREFIX)/lib
CONFIGURE_OPTIONS += --enable-shared
CONFIGURE_OPTIONS += --enable-targets=$(GNU_ARCH_64)

# Linker - use Sun ld
CONFIGURE_OPTIONS+=	--without-gnu-ld
CONFIGURE_OPTIONS+=	--with-ld=/usr/bin/ld

# Assembler - use GNU assembler
CONFIGURE_OPTIONS+=	--with-gnu-as
CONFIGURE_OPTIONS+=	--with-as=$(USRDIR)/bin/gas

# Languages (C, C++, Objective C and Fortran)
CONFIGURE_OPTIONS+=	--enable-stage1-languages=c
CONFIGURE_OPTIONS+=	--enable-languages=c,c++,objc,fortran
CONFIGURE_OPTIONS+=	--enable-objc-gc

# Features
CONFIGURE_OPTIONS+=	--enable-libssp		# Stack Protection
CONFIGURE_OPTIONS+=	--disable-libitm	# Transactional Memory
CONFIGURE_OPTIONS+=	--disable-libada	# ADA library
CONFIGURE_OPTIONS+=	--disable-lto		# Link Time Optimisations

# External Libraries
#CONFIGURE_OPTIONS+=	--with-mpc=$(USRDIR)
#CONFIGURE_OPTIONS+=	--with-mpfr=$(USRDIR)
#CONFIGURE_OPTIONS+=	--with-gmp=$(USRDIR)
CONFIGURE_OPTIONS+=	--with-libiconv-prefix=$(USRDIR)
CONFIGURE_OPTIONS+=	--without-ppl
CONFIGURE_OPTIONS+=	--without-cloog

# Disable generating fixed includes
COMPONENT_PRE_BUILD_ACTION+= \
	$(GSED) -i 's@\./fixinc\.sh@-c true@' $(SOURCE_DIR)/gcc/Makefile.in

COMPONENT_POST_INSTALL_ACTION = \
        ( strip $(PROTO_BINDIR)/* \
                $(PROTO_LIBDIR)/*so* \
                $(PROTO_LIBDIR)/*/*so* \
                $(PROTO_LIBDIR)/gcc/*/*/cc1 \
                $(PROTO_LIBDIR)/gcc/*/*/cc1obj \
                $(PROTO_LIBDIR)/gcc/*/*/cc1plus \
                $(PROTO_LIBDIR)/gcc/*/*/collect2 \
                $(PROTO_LIBDIR)/gcc/*/*/f951 \
                $(PROTO_LIBDIR)/gcc/*/*/install-tools/fixincl \
                >/dev/null 2>&1; true )

build:		$(BUILD_32)

install:	$(INSTALL_32)

