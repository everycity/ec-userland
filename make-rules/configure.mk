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

#
# Rules and Macros for building opens source software that uses configure /
# GNU auto* tools to configure their build for the system they are on.  This
# uses GNU Make to build the components to take advantage of the viewpath
# support and build multiple version (32/64 bit) from a shared source.
#
# To use these rules, include ../make-rules/configure.mk in your Makefile
# and define "build", "install", and "test" targets appropriate to building
# your component.
#
# Any additional pre/post configure, build, or install actions can be specified
# in your make file by setting them in on of the following macros:
#	COMPONENT_PRE_CONFIGURE_ACTION, COMPONENT_POST_CONFIGURE_ACTION
#	COMPONENT_PRE_BUILD_ACTION, COMPONENT_POST_BUILD_ACTION
#	COMPONENT_PRE_INSTALL_ACTION, COMPONENT_POST_INSTALL_ACTION
#	COMPONENT_PRE_TEST_ACTION, COMPONENT_POST_TEST_ACTION
#
# If component specific make targets need to be used for build or install, they
# can be specified in
#	COMPONENT_BUILD_TARGETS, COMPONENT_INSTALL_TARGETS
#	COMPONENT_TEST_TARGETS
#

# We may want to relocate software to an alternative path, such as $(USRDIR)
CONFIGURE_PREFIX=	$(APPLICATION_PREFIX)
CONFIGURE_SYSCONFDIR=	$(APPLICATION_ETCDIR)
CONFIGURE_BINDIR=	$(APPLICATION_BINDIR)
CONFIGURE_LIBDIR=	$(APPLICATION_LIBDIR)
CONFIGURE_LIBEXECDIR=	$(APPLICATION_LIBDIR)
CONFIGURE_SBINDIR=	$(APPLICATION_SBINDIR)
CONFIGURE_MANDIR=	$(APPLICATION_MANDIR)
CONFIGURE_LOCALEDIR=	$(APPLICATION_LOCALEDIR)
CONFIGURE_LOCALSTATEDIR=	$(APPLICATION_VARDIR)
CONFIGURE_INFODIR=	$(APPLICATION_INFODIR)
CONFIGURE_INCLUDEDIR=	$(APPLICATION_INCDIR)

CONFIGURE_DEFAULT_ENV ?= yes
CONFIGURE_DEFAULT_DIRS ?= yes
CONFIGURE_DEFAULT_HOST ?= yes
CONFIGURE_DEFAULT_COMPILERS ?= yes
CONFIGURE_DEFAULT_SHAREDLIB ?= yes
CONFIGURE_DEFAULT_CPPFLAGS ?= no
CONFIGURE_DEFAULT_LDFLAGS ?= no

ifeq ($(CONFIGURE_DEFAULT_ENV),yes)
CONFIGURE_ENV=  CONFIG_SHELL="$(CONFIG_SHELL)"
CONFIGURE_ENV+= PATH="$(PATH)"
CONFIGURE_ENV+= CC="$(CC)" 
CONFIGURE_ENV+= CXX="$(CXX)" 
CONFIGURE_ENV+= CFLAGS="$(CFLAGS)" 
CONFIGURE_ENV+= CXXFLAGS="$(CXXFLAGS)" 
#CONFIGURE_ENV+= LIBS="$(LIBS)" 
CONFIGURE_ENV+= MAKE="$(GMAKE)"
CONFIGURE_ENV+= M4="$(GM4)"
CONFIGURE_ENV+= SED="$(GSED)"
CONFIGURE_ENV+= PERL="$(PERL)"
CONFIGURE_ENV+= PYTHON="$(PYTHON)"
CONFIGURE_ENV+= PYTHONMODULEDIR="$(PYTHON_VENDOR_PACKAGES)"
CONFIGURE_ENV+= INSTALL="$(INSTALL)"
CONFIGURE_ENV+= PKG_CONFIG="$(PKG_CONFIG)"
CONFIGURE_ENV+= PKG_CONFIG_PATH="$(PKG_CONFIG_PATH)"
endif

CONFIGURE_DEFAULT_CPPFLAGS ?= yes
ifeq ($(CONFIGURE_DEFAULT_CPPFLAGS),yes)
CPPFLAGS += $(CPPFLAGS.$(BITS))
CPPFLAGS += $(CPPFLAGS.$(MACH))
CONFIGURE_ENV+= CPPFLAGS="$(CPPFLAGS)"
endif

CONFIGURE_DEFAULT_LDFLAGS ?= yes
ifeq ($(CONFIGURE_DEFAULT_LDFLAGS),yes)
LDFLAGS += $(LDFLAGS.$(MACH))
LDFLAGS += $(LDFLAGS.$(BITS))
CONFIGURE_ENV+= LDFLAGS="$(LDFLAGS)" 
endif

ifeq ($(CONFIGURE_DEFAULT_COMPILERS),yes)
CONFIGURE_OPTIONS+= CC="$(CC)"
CONFIGURE_OPTIONS+= CXX="$(CXX)"
endif

ifeq ($(CONFIGURE_DEFAULT_HOST),yes)
CONFIGURE_OPTIONS.32+= --build=$(GNU_ARCH)
CONFIGURE_OPTIONS.64+= --build=$(GNU_ARCH_64)
endif

CONFIGURE_OPTIONS+= --prefix=$(CONFIGURE_PREFIX)

ifeq ($(CONFIGURE_DEFAULT_DIRS),yes)
CONFIGURE_OPTIONS+= --infodir=$(CONFIGURE_INFODIR)
CONFIGURE_OPTIONS+= --mandir=$(CONFIGURE_MANDIR)
CONFIGURE_OPTIONS+= --bindir=$(CONFIGURE_BINDIR)
CONFIGURE_OPTIONS+= --libdir=$(CONFIGURE_LIBDIR)
CONFIGURE_OPTIONS+= --sbindir=$(CONFIGURE_SBINDIR)
#CONFIGURE_OPTIONS+= --sysconfdir=$(CONFIGURE_SYSCONFDIR)
#CONFIGURE_OPTIONS+= --localstatedir=$(CONFIGURE_LOCALSTATEDIR)
#CONFIGURE_OPTIONS+= --includedir=$(CONFIGURE_INCLUDEDIR)
#CONFIGURE_OPTIONS+= --libexecdir=$(CONFIGURE_LIBEXECDIR)
endif

#ifeq ($(CONFIGURE_DEFAULT_SHAREDLIB),yes)
#CONFIGURE_OPTIONS+= --enable-shared
#CONFIGURE_OPTIONS+= --disable-static
#CONFIGURE_OPTIONS+= --with-pic
#endif

COMPONENT_INSTALL_ARGS+=       DESTDIR=$(PROTO_DIR)

# If we are installing into a non-default location, we need to ensure that
# includes and libraries get found
#ifneq ($(CONFIGURE_PREFIX), $(USRDIR))
#	RELOC_INCLUDES+=	-I$(CONFIGURE_INCLUDEDIR)
#	RELOC_LDFLAGS+=		-L$(CONFIGURE_LIBDIR) -R$(CONFIGURE_LIBDIR)
#endif

$(BUILD_DIR_32)/.configured:	BITS=32
$(BUILD_DIR_64)/.configured:	BITS=64

CONFIGURE_ENV+= $(CONFIGURE_ENV.$(BITS))

CONFIGURE_OPTIONS+= $(CONFIGURE_OPTIONS.$(BITS))

# configure the unpacked source for building 32 and 64 bit version
CONFIGURE_SCRIPT=	$(SOURCE_DIR)/configure
COMPONENT_CONFIGURE_ROOT = $(@D)
$(BUILD_DIR)/%/.configured:	$(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(COMPONENT_CONFIGURE_ROOT) ; $(ENV) $(CONFIGURE_ENV) $(CONFIG_SHELL) \
		$(CONFIGURE_SCRIPT) $(CONFIGURE_OPTIONS))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

COMPONENT_BUILD_ARGS += -j$(BUILD_JOBS)
# build the configured source
COMPONENT_BUILD_ROOT = $(@D)
$(BUILD_DIR)/%/.built:	$(BUILD_DIR)/%/.configured
	$(COMPONENT_PRE_BUILD_ACTION)
	(cd $(COMPONENT_BUILD_ROOT) ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(GMAKE) $(COMPONENT_BUILD_ARGS) \
		$(COMPONENT_BUILD_TARGETS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

# install the built source into a prototype area
COMPONENT_INSTALL_ROOT = $(@D)
$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	(cd $(COMPONENT_INSTALL_ROOT) ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
			$(COMPONENT_INSTALL_ARGS) $(COMPONENT_INSTALL_TARGETS))
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

# test the built source
$(BUILD_DIR)/%/.tested:	$(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_TEST_ACTION)
	(cd $(@D) ; $(ENV) $(COMPONENT_TEST_ENV) $(GMAKE) \
			$(COMPONENT_TEST_ARGS) $(COMPONENT_TEST_TARGETS))
	$(COMPONENT_POST_TEST_ACTION)
	$(TOUCH) $@

clean::
	$(RM) -r $(BUILD_DIR)
