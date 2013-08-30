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

#
# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
# Copyright (c) 2012-2013, EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		ruby
COMPONENT_FMRI=		runtime/ruby-18
COMPONENT_VERSION=	1.8.7
COMPONENT_PATCH_VERSION=	374
COMPONENT_LICENSE=	GPLv2, LGPLv2.1, Artistic, BSD, PD
COMPONENT_PROJECT_URL=	"http://www.ruby-lang.org/"
COMPONENT_SUMMARY=	Ruby & RubyGems
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)-p$(COMPONENT_PATCH_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:b4e34703137f7bfb8761c4ea474f7438d6ccf440b3d35f39cc5e4d4e239c07e3
COMPONENT_ARCHIVE_URL=	http://ftp.ruby-lang.org/pub/ruby/1.8/$(COMPONENT_ARCHIVE)
IPS_COMPONENT_VERSION=	$(COMPONENT_VERSION).$(COMPONENT_PATCH_VERSION)

# rubygems 
COMPONENT_SRC_1=	rubygems-1.8.24
COMPONENT_ARCHIVE_1=	$(COMPONENT_SRC_1).tgz
COMPONENT_ARCHIVE_HASH_1=	sha256:4b61fa51869b3027bcfe67184b42d2e8c23fa6ab17d47c5c438484b9be2821dd
COMPONENT_ARCHIVE_URL_1=	http://production.cf.rubygems.org/rubygems/$(COMPONENT_ARCHIVE_1)

SOURCE_DIR_1=$(COMPONENT_DIR)/source/$(COMPONENT_SRC_1)
CLEAN_PATHS += $(SOURCE_DIR_1)

include ../../../make-rules/prep.mk
include ../../../make-rules/ips.mk
include ../../../make-rules/configure.mk

LINKER=	gcc

# COMPONENT_VERSION <major>.<minor>.<teeny>
# is transformed into <major>.<minor> for RUBY_VER.
# First change the separator '.' to ' ', so we can use "word" to pull the 
# first two space-separated words from the string.
RUBY_VER_WORDS =	$(subst ., ,$(COMPONENT_VERSION))
RUBY_VER =	$(word 1,$(RUBY_VER_WORDS)).$(word 2,$(RUBY_VER_WORDS))

GEMHOME.32 =	$(ECPREFIX)/var/ruby/$(RUBY_VER)/gem_home
GEMHOME.64 =	$(ECPREFIX)/var/ruby/$(RUBY_VER)/gem_home/$(MACH64)
GEMHOME =	$(GEMHOME.$(BITS))
PROTOGEMHOME =	$(PROTO_DIR)$(GEMHOME)

PROTORUBYDIR.32 =	$(PROTO_DIR)$(ECPREFIX)/lib/ruby/$(RUBY_VER)
PROTORUBYDIR.64 =	$(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/ruby/$(RUBY_VER)

PROTO_RBCONFIG_FILE.32=	$(PROTORUBYDIR.32)/$(MACH)-solaris$(SOLARIS_VERSION)/rbconfig.rb
PROTO_RBCONFIG_FILE.64=	$(PROTORUBYDIR.64)/x86_64-solaris$(SOLARIS_VERSION)/rbconfig.rb
PROTO_RBCONFIG_FILE =	$(PROTO_RBCONFIG_FILE.$(BITS))

# Since configure.in is patched, we need to autoconf after the patch.
# Also, unpack the 2nd archive for rubygems.
# Rubygems does not have patches, nor does it use configure nor make.
COMPONENT_PREP_ACTION = (cd $(@D) ; autoconf); \
	$(RM) -r $(SOURCE_DIR_1); \
	cd $(COMPONENT_DIR)/source; \
	$(UNPACK) $(UNPACK_ARGS) $(USERLAND_ARCHIVES)/$(COMPONENT_ARCHIVE_1)

# These modifications of ruby.1 must occur after ruby
# is installed, not before.  Although there are some other patches
# to ruby.1 that occur before, the ruby installation does some 
# formatting of ruby.1 that won't occur if the below changes
# are applied.
COMPONENT_POST_INSTALL_ACTION.32 += \
	/bin/sed -f Solaris/ruby.1.sedscript \
	$(PROTO_DIR)$(ECPREFIX)/share/man/man1/ruby$(RUBY_VER).1 > ruby$(RUBY_VER).1.mod ; \
	$(MV) ruby$(RUBY_VER).1.mod $(PROTO_DIR)$(ECPREFIX)/share/man/man1/ruby$(RUBY_VER).1 ;

# install rubygems using ruby installed in proto area
RUBYGEMS_INSTALL_ACTION.32 += \
	cd $(SOURCE_DIR_1); $(ENV) - \
	"DESTDIR=$(PROTO_DIR)" \
	LD_LIBRARY_PATH=$(PROTO_DIR)$(ECPREFIX)/lib \
	GEM_HOME=$(PROTOGEMHOME) \
	$(PROTO_DIR)$(ECPREFIX)/bin/ruby$(RUBY_VER) \
	-I$(PROTO_DIR)$(ECPREFIX)/lib/ruby/$(RUBY_VER) \
	-I$(PROTO_DIR)$(ECPREFIX)/lib/ruby/$(RUBY_VER)/$(MACH)-solaris$(SOLARIS_VERSION) \
	setup.rb --vendor --destdir=$(PROTO_DIR) ;
RUBYGEMS_INSTALL_ACTION.64 += \
	cd $(SOURCE_DIR_1); $(ENV) - \
	"DESTDIR=$(PROTO_DIR)" \
	LD_LIBRARY_PATH=$(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64) \
	GEM_HOME=$(PROTOGEMHOME) \
	$(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/ruby$(RUBY_VER) \
	-I$(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/ruby/$(RUBY_VER) \
	-I$(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/ruby/$(RUBY_VER)/x86_64-solaris$(SOLARIS_VERSION) \
	setup.rb --vendor --destdir=$(PROTO_DIR) ;
RUBYGEMS_INSTALL_ACTION =	$(RUBYGEMS_INSTALL_ACTION.$(BITS))

# Fix generated rbconfig.rb.
# This should NOT occur until AFTER rubygems installs;
# otherwise the GEM_HOME setting added to rbconfig.rb will cause setup.rb
# to attempt (and fail) to install rubygems docs on the build system,
# rather than in the proto area.
# Also fix magic line of gem script.
POST_RUBYGEMS_INSTALL_ACTION.32 += \
	cd $(COMPONENT_DIR) ; \
	/bin/sed -f Solaris/rbconfig.sedscript $(PROTO_RBCONFIG_FILE) \
	> rbconfig.rb.mod ; \
	$(MV) rbconfig.rb.mod $(PROTO_RBCONFIG_FILE) ; \
	/bin/sed -e '1s;^\#!/.*;\#!$(ECPREFIX)/bin/ruby$(RUBY_VER);' \
	$(PROTO_DIR)$(ECPREFIX)/bin/gem$(RUBY_VER) > gem.mod ; \
	$(MV) gem.mod $(PROTO_DIR)$(ECPREFIX)/bin/gem$(RUBY_VER)
POST_RUBYGEMS_INSTALL_ACTION.64 += \
	cd $(COMPONENT_DIR) ; \
	/bin/sed -f Solaris/rbconfig.sedscript $(PROTO_RBCONFIG_FILE) \
	> rbconfig.rb.mod ; \
	/bin/sed -e 's;gem_home;gem_home/$(MACH64);' rbconfig.rb.mod \
	> $(PROTO_RBCONFIG_FILE) && $(RM) rbconfig.rb.mod; \
	/bin/sed -e '1s;^\#!/.*;\#!$(ECPREFIX)/bin/$(MACH64)/ruby$(RUBY_VER);' \
	$(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/gem$(RUBY_VER) > gem.mod ; \
	$(MV) gem.mod $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/gem$(RUBY_VER) ; \
        cd $(COMPONENT_DIR)/Solaris/scripts && for file in * ; do \
	/bin/sed -e '1s;^\#!/.*;\#!$(ECPREFIX)/bin/$(MACH64)/ruby$(RUBY_VER);' $$file \
	> $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/$$file\$(RUBY_VER) ; done
POST_RUBYGEMS_INSTALL_ACTION +=	$(POST_RUBYGEMS_INSTALL_ACTION.$(BITS))

COMPONENT_POST_INSTALL_ACTION += $(COMPONENT_POST_INSTALL_ACTION.$(BITS))
COMPONENT_POST_INSTALL_ACTION += $(RUBYGEMS_INSTALL_ACTION)
COMPONENT_POST_INSTALL_ACTION += $(POST_RUBYGEMS_INSTALL_ACTION)

# dtrace only available for i386 at this time;
# on sparc, a compiler bug (CR #6659110) prevents use of dtrace
DTRACE_FLAG_i386 =	--enable-dtrace
DTRACE_FLAG =		$(DTRACE_FLAG_$(MACH))

# dtrace.d, created in source dir during patch for dtrace,
# is needed for building
DTRACE_PRE_BUILD_i386 =	$(CP) $(SOURCE_DIR)/dtrace.d $(BUILD_DIR_$(BITS))
DTRACE_PRE_BUILD =	$(DTRACE_PRE_BUILD_$(MACH))
COMPONENT_PRE_BUILD_ACTION =	$(DTRACE_PRE_BUILD)

# default LD_OPTION $(LD_B_DIRECT) causes problems--
# during install of ruby, ruby is executed and will core dump
# after compiling with this option
LD_B_DIRECT=

# don't use LD_Z_IGNORE: causes ruby linker problems with 
# unreferenced symbol tgetent in libreadline, similar to CR #6919344
LD_Z_IGNORE=

# make build isn't thread safe.
COMPONENT_BUILD_GMAKE_ARGS=

CONFIGURE_PREFIX = $(ECPREFIX)
CONFIGURE_OPTIONS += --program-suffix=$(RUBY_VER)
CONFIGURE_OPTIONS += $(DTRACE_FLAG)
CONFIGURE_OPTIONS += --enable-shared
CONFIGURE_OPTIONS += --enable-install-doc
CONFIGURE_OPTIONS += --disable-option-checking
CONFIGURE_OPTIONS += --with-openssl
CONFIGURE_OPTIONS += --with-tk-dir=/usr
CONFIGURE_OPTIONS += --with-curses-dir=$(ECPREFIX)
CONFIGURE_OPTIONS += CFLAGS="$(CFLAGS)"
CONFIGURE_OPTIONS += LDSHARED="$(CC) $(LD_BITS) -shared"

include ../../../make-rules/shared-targets.mk

# common targets

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

# one expected failure in TestHTTP::HTTPConnectionTest
#test:	$(TEST_32)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../../make-rules/depend.mk
