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
# Copyright 2011, 2012, EveryCity Ltd. All rights reserved.
#

CONFIGURE_DEFAULT_LDFLAGS = no
CONFIGURE_DEFAULT_CPPFLAGS = no
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gcc
COMPONENT_VERSION=	4.4.5
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:2b1427a932a620c909d74f1e4821ed90c90fd350
COMPONENT_ARCHIVE_URL=	http://ftp.gnu.org/gnu/gcc/$(COMPONENT_NAME)-$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk

CANONICAL_MANIFESTS =	gcc44-$(OS_VERSION).p5m gcc44-runtime-$(OS_VERSION).p5m

include ../../make-rules/ips.mk

CC_BITS=
CXXFLAGS=
CFLAGS = -g -O2

COMPONENT_PRE_CONFIGURE_ACTION += \
	( cd $(SOURCE_DIR)/fixincludes && $(CONFIG_SHELL) ./genfixes && \
	$(RM) dummy.p5m && \
	$(CP) $(COMPONENT_DIR)/manifests/gcc44-$(OS_VERSION)         \
		$(COMPONENT_DIR)/gcc44-$(OS_VERSION).p5m &&          \
	$(CP) $(COMPONENT_DIR)/manifests/gcc44-runtime-$(OS_VERSION) \
		$(COMPONENT_DIR)/gcc44-runtime-$(OS_VERSION).p5m )

CONFIGURE_PREFIX = $(USRDIR)/gcc/4.4

CONFIGURE_OPTIONS  +=           --libexecdir=$(CONFIGURE_PREFIX)/lib
CONFIGURE_OPTIONS  +=           --mandir=$(CONFIGURE_PREFIX)/share/man
CONFIGURE_OPTIONS  +=           --infodir=$(CONFIGURE_PREFIX)/share/info

CONFIGURE_OPTIONS  +=           --with-mpc=$(USRDIR)
CONFIGURE_OPTIONS  +=           --with-mpfr=$(USRDIR)
CONFIGURE_OPTIONS  +=           --with-gmp=$(USRDIR)
CONFIGURE_OPTIONS  +=           --without-ppl
CONFIGURE_OPTIONS  +=           --without-cloog
CONFIGURE_OPTIONS  +=		--without-gnu-ld
CONFIGURE_OPTIONS  +=           --with-gnu-as
CONFIGURE_OPTIONS  +=           --with-as=$(USRDIR)/bin/gas
CONFIGURE_OPTIONS  +=           --with-ld=/usr/bin/ld
CONFIGURE_OPTIONS  +=           --enable-stage1-languages=c
CONFIGURE_OPTIONS  +=           --enable-languages=c,c++,objc,fortran
#CONFIGURE_OPTIONS  +=           --with-stage1-ldflags=-R$(USRDIR)/lib
#CONFIGURE_OPTIONS  +=           --with-boot-ldflags=-R$(USRDIR)/lib
CONFIGURE_OPTIONS  +=           --enable-targets=$(GNU_ARCH_64)

COMPONENT_BUILD_ENV += SHELL="$(CONFIG_SHELL)"
COMPONENT_BUILD_ENV += CFLAGS="$(CFLAGS)"
COMPONENT_BUILD_ENV += STAGE1_CFLAGS="$(CFLAGS)"
COMPONENT_BUILD_ENV += CFLAGS_FOR_TARGET="$(CFLAGS)"
COMPONENT_BUILD_ENV += CFLAGS_FOR_BUILD="$(CFLAGS)"
COMPONENT_BUILD_TARGETS = bootstrap

COMPONENT_PRE_INSTALL_ACTION = \
	( $(RM) dummy.p5m )

build:		$(BUILD_32)

install:	$(INSTALL_32)
