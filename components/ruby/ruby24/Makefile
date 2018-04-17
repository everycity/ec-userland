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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		ruby
COMPONENT_FMRI=		runtime/ruby-24
COMPONENT_VERSION=	2.4.4
COMPONENT_LICENSE=	2-clause BSDL
COMPONENT_PROJECT_URL=	http://www.ruby-lang.org/
COMPONENT_SUMMARY=	The Ruby Programming Language & RubyGems
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:254f1c1a79e4cc814d1e7320bc5bdd995dc57e08727d30a767664619a9c8ae5a
COMPONENT_ARCHIVE_URL=	ftp://ftp.ruby-lang.org//pub/ruby/2.4/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

RUBY_VER=	2.4

# Build weird when threaded.
COMPONENT_BUILD_GMAKE_ARGS=

CONFIGURE_OPTIONS+=	--with-soname=ruby$(RUBY_VER) --program-suffix=$(RUBY_VER)
CONFIGURE_OPTIONS+=	--enable-shared
CONFIGURE_OPTIONS.32+=	ac_cv_func_dl_iterate_phdr=no
CONFIGURE_OPTIONS+=	--disable-dtrace

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

