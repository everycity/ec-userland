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

# Native Utilities
CAT=		$(SYSTEMBINDIR)/cat
MKDIR=		$(SYSTEMBINDIR)/mkdir -p
RM=		$(SYSTEMBINDIR)/rm -f
CP=		$(SYSTEMBINDIR)/cp -f
MV=		$(SYSTEMBINDIR)/mv -f
LN=		$(SYSTEMBINDIR)/ln
SYMLINK=	$(SYSTEMBINDIR)/ln -s
M4=		$(SYSTEMUSRBINDIR)/m4
ENV=		$(SYSTEMUSRBINDIR)/env
CHMOD=		$(SYSTEMUSRBINDIR)/chmod
NAWK=		$(SYSTEMUSRBINDIR)/nawk
TEE=		$(SYSTEMUSRBINDIR)/tee

# GNU Utilities
ECHO=		$(BINDIR.32)/echo
CMAKE=		cmake
GMAKE=		$(BINDIR.32)/gmake
GPATCH=		$(BINDIR.32)/patch
PATCH_LEVEL=	1
GPATCH_BACKUP=	--backup --version-control=numbered
GPATCH_FLAGS=	-p$(PATCH_LEVEL) $(GPATCH_BACKUP)
GSED=		$(BINDIR.32)/sed
GM4=		$(BINDIR.32)/gm4
TOUCH=		$(BINDIR.32)/touch
INSTALL=	$(BINDIR.32)/install
ACLOCAL=	$(BINDIR.32)/aclocal-1.10
AUTOMAKE=	$(BINDIR.32)/automake-1.10
AUTORECONF= 	$(BINDIR.32)/autoreconf
# Use 32bit/64bit pkg-config paths
PKG_CONFIG=	$(BINDIR)/pkg-config
PKG_CONFIG_PATH= $(LIBDIR)/pkgconfig

# Tools
BASS_O_MATIC=	$(WS_TOOLS)/bass-o-matic
CLONEY=		$(WS_TOOLS)/cloney
PKGREPO=	$(BINDIR.32)/pkgrepo
PKGSEND=	$(BINDIR.32)/pkgsend
PKGLINT=	$(BINDIR.32)/pkglint

# Python
PYTHON_VERSION=		2.6
PYTHON_VERSIONS=	2.6
#PYTHON_VERSIONS=	2.6 2.7

#PYTHON_PREFIX=	$(APPDIR)/python/$(PYTHON_VERSION)
PYTHON_PREFIX=	/usr

PYTHON_VENDOR_PACKAGES.32= $(PYTHON_PREFIX)/lib/python$(PYTHON_VERSION)/vendor-packages
PYTHON_VENDOR_PACKAGES.64= $(PYTHON_PREFIX)/lib/python$(PYTHON_VERSION)/vendor-packages/64
PYTHON_VENDOR_PACKAGES= $(PYTHON_VENDOR_PACKAGES.$(BITS))

PYTHON.2.6.32=	$(BINDIR.32)/python2.6
PYTHON.2.6.64=	$(BINDIR.64)/python2.6

PYTHON.2.7.32=	$(BINDIR.32)/python2.7
PYTHON.2.7.64=	$(BINDIR.64)/python2.7

PYTHON.32=	$(PYTHON.$(PYTHON_VERSION).32)
PYTHON.64=	$(PYTHON.$(PYTHON_VERSION).64)
PYTHON=		$(PYTHON.$(PYTHON_VERSION).$(BITS))

# The default is site-packages, but that directory belongs to the end-user.
# Modules which are shipped by the OS but not with the core Python distribution
# belong in vendor-packages.
PYTHON_LIB= 	$(PYTHON_VENDOR_PACKAGES)

# Perl
PERL_VERSION=	5.12
PERL_VERSIONS=	5.12
PERL.5.12=	$(APPDIR)/perl/5.12/bin/perl

#PERL_VERSION=	5.16
#PERL_VERSIONS=	5.16
PERL.5.16=	$(APPDIR)/perl/5.16/bin/perl

PERL=		$(BINDIR.32)/perl

PERL_ARCH=     $(shell $(PERL) -e 'use Config; print $$Config{archname}')
# Optimally we should ask perl which C compiler was used but it doesn't
# result in a full path name.  Only "c" is being recorded
# inside perl builds while we actually need a full path to
# the studio compiler.
#PERL_CC =      $(shell $(PERL) -e 'use Config; print $$Config{cc}')
PERL_OPTIMIZE= $(shell $(PERL) -e 'use Config; print $$Config{optimize}')

PKG_MACROS+=   PERL_ARCH=$(PERL_ARCH)
PKG_MACROS+=   PERL_VERSION=$(PERL_VERSION)

# Java
JAVA_HOME=	$(APPDIR)/java/active

