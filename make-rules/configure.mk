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

#
# Rules and Macros for building opens source software that uses configure /
# GNU auto* tools to configure their build for the system they are on.  This
# uses GNU Make to build the components to take advantage of the viewpath
# support and build multiple version (32/64 bit) from a shared source.
#
# To use these rules, include ../make-rules/configure.mk in your Makefile
# and define "build", "install", and "test" targets appropriate to building
# your component.
# Ex:
#
# 	build:		$(SOURCE_DIR)/build/$(MACH32)/.built \
#	 		$(SOURCE_DIR)/build/$(MACH64)/.built
#
#	install:	$(SOURCE_DIR)/build/$(MACH32)/.installed \
#	 		$(SOURCE_DIR)/build/$(MACH64)/.installed
#
#	test:		$(SOURCE_DIR)/build/$(MACH32)/.tested \
#	 		$(SOURCE_DIR)/build/$(MACH64)/.tested
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

CONFIGURE_PREFIX =	$(USRDIR)

CONFIGURE_BINDIR.32 =	$(CONFIGURE_PREFIX)/bin
CONFIGURE_BINDIR.64 =	$(CONFIGURE_PREFIX)/bin/$(MACH64)
#CONFIGURE_SYSCONFDIR =	$(CONFIGURE_PREFIX)/etc
CONFIGURE_LIBDIR.32 =	$(CONFIGURE_PREFIX)/lib
CONFIGURE_LIBDIR.64 =	$(CONFIGURE_PREFIX)/lib/$(MACH64)
CONFIGURE_SBINDIR.32 =	$(CONFIGURE_PREFIX)/bin
CONFIGURE_SBINDIR.64 =	$(CONFIGURE_PREFIX)/bin/$(MACH64)
CONFIGURE_MANDIR =	$(CONFIGURE_PREFIX)/share/man
CONFIGURE_LOCALEDIR =	$(CONFIGURE_PREFIX)/share/locale
#CONFIGURE_LOCALSTATEDIR =	$(CONFIGURE_PREFIX)/var
CONFIGURE_INFODIR =	$(CONFIGURE_PREFIX)/share/info
# all texinfo documentation seems to go to /usr/share/info no matter what
CONFIGURE_INFODIR =	$(USRDIR)/share/info
CONFIGURE_INCLUDEDIR =	$(USRDIR)/include

CONFIGURE_ENV	=	CONFIG_SHELL="$(CONFIG_SHELL)"
#CONFIGURE_ENV	+=	PATH="$(PATH)"
CONFIGURE_ENV	+=	MAKE="$(GMAKE)"
CONFIGURE_ENV	+=	CC="$(CC)"
CONFIGURE_ENV	+=	CXX="$(CXX)"
CONFIGURE_ENV	+=	CFLAGS="$(CFLAGS)"
CONFIGURE_ENV	+=	CXXFLAGS="$(CXXFLAGS)"

# Set up PKG_CONFIG to use correct version
CONFIGURE_ENV	+=	PKG_CONFIG="$(PKG_CONFIG)" PKG_CONFIG_PATH="$(PKG_CONFIG_PATH)"

CONFIGURE_ENV	+=	$(CONFIGURE_ENV.$(BITS))

ifeq ($(CONFIGURE_DEFAULT_CPPFLAGS),yes)
#CPPFLAGS += $(CPPFLAGS.$(MACH))
CPPFLAGS += $(CPPFLAGS.$(BITS))
CONFIGURE_ENV+= CPPFLAGS="$(CPPFLAGS)"
endif

CONFIGURE_DEFAULT_LDFLAGS ?= yes
ifeq ($(CONFIGURE_DEFAULT_LDFLAGS),yes)
#LDFLAGS += $(LDFLAGS.$(MACH))
LDFLAGS += $(LDFLAGS.$(BITS))
CONFIGURE_ENV+= LDFLAGS="$(LDFLAGS)" 
endif

CONFIGURE_DEFAULT_HOST ?= yes
ifeq ($(CONFIGURE_DEFAULT_HOST),yes)
CONFIGURE_OPTIONS.32+= --build=$(GNU_ARCH_32)
CONFIGURE_OPTIONS.64+= --build=$(GNU_ARCH_64)
endif

CONFIGURE_OPTIONS += --prefix=$(CONFIGURE_PREFIX)
CONFIGURE_OPTIONS += --mandir=$(CONFIGURE_MANDIR)
CONFIGURE_OPTIONS += --infodir=$(CONFIGURE_INFODIR)
CONFIGURE_OPTIONS += --bindir=$(CONFIGURE_BINDIR.$(BITS))
CONFIGURE_OPTIONS += --libdir=$(CONFIGURE_LIBDIR.$(BITS))
CONFIGURE_OPTIONS += --sbindir=$(CONFIGURE_SBINDIR.$(BITS))
CONFIGURE_DEFAULT_LIBEXECDIR ?= yes
ifeq ($(CONFIGURE_DEFAULT_LIBEXECDIR),yes)
CONFIGURE_OPTIONS += --libexecdir=$(CONFIGURE_LIBDIR.$(BITS))
endif
CONFIGURE_DEFAULT_SYSCONFIGDIR ?= yes
ifeq ($(CONFIGURE_DEFAULT_SYSCONFIGDIR),yes)
CONFIGURE_OPTIONS += --sysconfdir=$(CONFIGURE_SYSCONFDIR)
endif
CONFIGURE_DEFAULT_LOCALSTATEDIR ?= yes
ifeq ($(CONFIGURE_DEFAULT_LOCALSTATEDIR),yes)
CONFIGURE_OPTIONS += --localstatedir=$(CONFIGURE_LOCALSTATEDIR)
endif

COMPONENT_INSTALL_ARGS +=	DESTDIR=$(PROTO_DIR)

$(BUILD_DIR_32)/.configured:	BITS=32
$(BUILD_DIR_64)/.configured:	BITS=64

CONFIGURE_OPTIONS += $(CONFIGURE_OPTIONS.$(BITS))

# configure the unpacked source for building 32 and 64 bit version
CONFIGURE_SCRIPT =	$(SOURCE_DIR)/configure
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
	(cd $(COMPONENT_CONFIGURE_ROOT) ; $(ENV) $(COMPONENT_BUILD_ENV) \
		$(GMAKE) $(COMPONENT_BUILD_GMAKE_ARGS) $(COMPONENT_BUILD_ARGS) \
		$(COMPONENT_BUILD_TARGETS))
	$(COMPONENT_POST_BUILD_ACTION)
	$(TOUCH) $@

# install the built source into a prototype area
COMPONENT_BUILD_ROOT = $(@D)
$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	(cd $(COMPONENT_CONFIGURE_ROOT) ; $(ENV) $(COMPONENT_INSTALL_ENV) $(GMAKE) \
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
