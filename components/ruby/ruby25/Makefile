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
# Copyright 2020 EveryCity Ltd. All rights reserved.
#
include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		ruby
COMPONENT_FMRI=		runtime/ruby-25
COMPONENT_MJR_VERSION=	2.5
COMPONENT_MNR_VERSION=	8
COMPONENT_VERSION=	$(COMPONENT_MJR_VERSION).$(COMPONENT_MNR_VERSION)
COMPONENT_LICENSE=	2-clause BSDL
COMPONENT_PROJECT_URL=	http://www.ruby-lang.org/
COMPONENT_SUMMARY=	The Ruby Programming Language & RubyGems
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6c0bdf07876c69811a9e7dc237c43d40b1cb6369f68e0e17953d7279b524ad9a
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_RUBY)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

RUBY_VER=	$(COMPONENT_MJR_VERSION)

# Build weird when threaded.
COMPONENT_BUILD_GMAKE_ARGS=

CONFIGURE_OPTIONS+=	--with-soname=ruby$(RUBY_VER) --program-suffix=$(RUBY_VER)
CONFIGURE_OPTIONS+=	--enable-shared

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
