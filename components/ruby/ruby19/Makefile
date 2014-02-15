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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		ruby
COMPONENT_FMRI=		runtime/ruby-19
COMPONENT_VERSION=	1.9.3-p484
IPS_COMPONENT_VERSION=	1.9.3.484
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	http://www.ruby-lang.org/
COMPONENT_SUMMARY=	The Ruby Programming Language & RubyGems
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d684bc3a5ba72cda9ef30039f783c0f8cdc325bae5c8738c7bf05577cbe8f31d
COMPONENT_ARCHIVE_URL=	ftp://ftp.ruby-lang.org//pub/ruby/1.9/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

RUBY_VER=	1.9

# Build weird when threaded.
COMPONENT_BUILD_GMAKE_ARGS=

CONFIGURE_OPTIONS+=	--with-soname=ruby$(RUBY_VER) --program-suffix=$(RUBY_VER)
#--program-suffix=$(RUBY_VER)
CONFIGURE_OPTIONS+=	--enable-shared
# configure tries to be clever and guesses incorrectly
CONFIGURE_OPTIONS.32+=	ac_cv_sys_file_offset_bits=32

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

