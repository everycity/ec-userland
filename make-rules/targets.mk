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

SHELL=		/bin/bash
CONFIG_SHELL=	/bin/bash

OS_VERSION=		$(shell uname -r)
SOLARIS_VERSION=	$(OS_VERSION:5.%=2.%)

BASS_O_MATIC=	$(WS_TOOLS)/bass-o-matic
CLONEY=	$(WS_TOOLS)/cloney


# set MACH from uname -p to either sparc or i386
MACH=		$(shell uname -p)

# set MACH32 from MACH to either sparcv7 or i86
MACH32_1=	$(MACH:sparc=sparcv7)
MACH32=	$(MACH32_1:i386=i86)

# set MACH64 from MACH to either sparcv9 or amd64
MACH64_1=	$(MACH:sparc=sparcv9)
MACH64=	$(MACH64_1:i386=amd64)

# GNU uses x86_64 instead of amd64
MACH64_GNU=	$(MACH64:amd64=x86_64)

PLAT_1=	$(MACH:sparc=sun)
PLAT=		$(PLAT_1:i386=pc)

GNU_ARCH    =   $(MACH)-$(PLAT)-solaris$(SOLARIS_VERSION)
GNU_ARCH_64=   $(MACH64:amd64=x86_64)-$(PLAT)-solaris$(SOLARIS_VERSION)

CONFIGURE_32=		$(BUILD_DIR_32)/.configured
CONFIGURE_64=		$(BUILD_DIR_64)/.configured

BUILD_DIR_32=		$(BUILD_DIR)/$(MACH32)
BUILD_DIR_64=		$(BUILD_DIR)/$(MACH64)

BUILD_32=		$(BUILD_DIR_32)/.built
BUILD_64=		$(BUILD_DIR_64)/.built
BUILD_32_and_64=	$(BUILD_32) $(BUILD_64)
$(BUILD_DIR_32)/.built:		BITS=32
$(BUILD_DIR_64)/.built:		BITS=64

INSTALL_32=		$(BUILD_DIR_32)/.installed
INSTALL_64=		$(BUILD_DIR_64)/.installed
INSTALL_32_and_64=	$(INSTALL_32) $(INSTALL_64)
$(BUILD_DIR_32)/.installed:       BITS=32
$(BUILD_DIR_64)/.installed:       BITS=64

# set the default target for installation of the component
COMPONENT_INSTALL_TARGETS=	install

TEST_32=		$(BUILD_DIR_32)/.tested
TEST_64=		$(BUILD_DIR_64)/.tested
TEST_32_and_64=	$(TEST_32) $(TEST_64)
$(BUILD_DIR_32)/.tested:       BITS=32
$(BUILD_DIR_64)/.tested:       BITS=64

# set the default target for test of the component
COMPONENT_TEST_TARGETS=	check

INS.dir=        $(INSTALL) -d $@
INS.file=       $(INSTALL) -m 444 $< $(@D)

# Add any bit-specific settings
COMPONENT_BUILD_ENV+= $(COMPONENT_BUILD_ENV.$(BITS))
COMPONENT_BUILD_ARGS+= $(COMPONENT_BUILD_ARGS.$(BITS))
COMPONENT_INSTALL_ENV+= $(COMPONENT_INSTALL_ENV.$(BITS))
COMPONENT_INSTALL_ARGS+= $(COMPONENT_INSTALL_ARGS.$(BITS))

# define build jobs for parallel builds
DEF_JOBS ?= yes
JOBS ?= 1
ifeq ($(DEF_JOBS),yes)
    BUILD_JOBS = $(JOBS)
else
    BUILD_JOBS = 1
endif

# declare these phony so that we avoid filesystem conflicts.
.PHONY:	prep build install publish test clean clobber

# If there are no tests to execute
NO_TESTS=	test-nothing
test-nothing:
	@echo "There are no tests available at this time."


