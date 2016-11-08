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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		ruby
COMPONENT_FMRI=		runtime/ruby-23
COMPONENT_VERSION=	2.3.1
COMPONENT_LICENSE=	2-clause BSDL
COMPONENT_PROJECT_URL=	http://www.ruby-lang.org/
COMPONENT_SUMMARY=	The Ruby Programming Language & RubyGems
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:b87c738cb2032bf4920fef8e3864dc5cf8eae9d89d8d523ce0236945c5797dcd
COMPONENT_ARCHIVE_URL=	https://cache.ruby-lang.org/pub/ruby/2.3/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

RUBY_VER=	2.3

CONFIGURE_OPTIONS+=	--with-soname=ruby$(RUBY_VER) --program-suffix=$(RUBY_VER)
CONFIGURE_OPTIONS+=	--enable-shared

COMPONENT_POST_INSTALL_ACTION.32 = \
	$(GSED) -i -e 's/-std=iso9899:1999 -D_XOPEN_SOURCE=600//' \
	  $(PROTO_DIR)$(ECPREFIX)/lib/ruby/2.3.0/*/rbconfig.rb
COMPONENT_POST_INSTALL_ACTION.64 = \
	$(GSED) -i -e 's/-std=iso9899:1999 -D_XOPEN_SOURCE=600//' \
	  $(PROTO_DIR)$(ECPREFIX)/lib/$(MACH64)/ruby/2.3.0/*/rbconfig.rb

COMPONENT_POST_INSTALL_ACTION = $(COMPONENT_POST_INSTALL_ACTION.$(BITS))

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
