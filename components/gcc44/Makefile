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

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gcc
COMPONENT_VERSION=	4.4.5
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:2b1427a932a620c909d74f1e4821ed90c90fd350
COMPONENT_ARCHIVE_URL=	http://ftp.gnu.org/gnu/gcc/$(COMPONENT_NAME)-$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_ENV =

CONFIGURE_OPTIONS  +=           --with-mpc=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --with-mpfr=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --with-gmp=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --without-ppl
CONFIGURE_OPTIONS  +=           --without-cloog
CONFIGURE_OPTIONS  +=		--without-gnu-ld
CONFIGURE_OPTIONS  +=           --with-gnu-as
CONFIGURE_OPTIONS  +=           --with-as=$(ECPREFIX)/bin/as
CONFIGURE_OPTIONS  +=           --with-ld=/usr/ccs/bin/ld
CONFIGURE_OPTIONS  +=           --enable-stage1-languages=c
CONFIGURE_OPTIONS  +=           --enable-languages=c,c++,objc,fortran
CONFIGURE_OPTIONS  +=           --with-stage1-ldflags=-R$(ECPREFIX)/lib
CONFIGURE_OPTIONS  +=           --with-boot-ldflags=-R$(ECPREFIX)/lib

COMPONENT_POST_INSTALL_ACTION = \
        ( strip $(PROTO_DIR)/$(ECPREFIX)/bin/* \
                $(PROTO_DIR)/$(ECPREFIX)/lib/*so* \
                $(PROTO_DIR)/$(ECPREFIX)/lib/*/*so* \
                $(PROTO_DIR)/$(ECPREFIX)/lib/gcc/*/*/cc1 \
                $(PROTO_DIR)/$(ECPREFIX)/lib/gcc/*/*/cc1obj \
                $(PROTO_DIR)/$(ECPREFIX)/lib/gcc/*/*/cc1plus \
                $(PROTO_DIR)/$(ECPREFIX)/lib/gcc/*/*/collect2 \
                $(PROTO_DIR)/$(ECPREFIX)/lib/gcc/*/*/f951 \
                $(PROTO_DIR)/$(ECPREFIX)/lib/gcc/*/*/install-tools/fixincl \
                >/dev/null 2>&1; true )

build:		$(BUILD_32)

$(BUILD_DIR_32)/.manifestsset:	$(INSTALL_32)
	$(RM) dummy.p5m
	$(CP) $(COMPONENT_DIR)/manifests/gcc44-$(OS_VERSION) \
		$(COMPONENT_DIR)/gcc44-$(OS_VERSION).p5m
	$(CP) $(COMPONENT_DIR)/manifests/gcc44-runtime-$(OS_VERSION) \
		$(COMPONENT_DIR)/gcc44-runtime-$(OS_VERSION).p5m
	$(TOUCH) $@

install:	$(BUILD_DIR_32)/.manifestsset

