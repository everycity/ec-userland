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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

GMAKE=gmake -j16

COMPONENT_NAME=		gcc
COMPONENT_VERSION=	4.5.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:ad5c440526c98fd17a74eab80c031af6b64d9c90
COMPONENT_ARCHIVE_URL=	http://ftp.gnu.org/gnu/gcc/$(COMPONENT_NAME)-$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CC=/ec/bin/gcc
#CXX=/ec/bin/g++
#CFLAGS="-O3"

#CPPFLAGS+= -I$(ECPREFIX)/include
#LDFLAGS+= -L$(ECPREFIX)/lib -R$(ECPREFIX)/lib
 
#COMPONENT_CONFIGURE_ENV += LD_LIBRARY_PATH="$(ECPREFIX)/lib"
#COMPONENT_BUILD_ENV += LD_LIBRARY_PATH="$(ECPREFIX)/lib"
#COMPONENT_INSTALL_ENV += LD_LIBRARY_PATH="$(ECPREFIX)/lib"
#COMPONENT_CONFIGURE_ENV += CPPFLAGS="$(CPPFLAGS)" LDFLAGS="$(LDFLAGS)"

#CONFIGURE_OPTIONS  +=           CPPFLAGS="$(CPPFLAGS)"
#CONFIGURE_OPTIONS  +=           CFLAGS="$(CFLAGS)"
#CONFIGURE_OPTIONS  +=           LDFLAGS="$(LDFLAGS)"
#CONFIGURE_OPTIONS  +=           --prefix=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --enable-lto
CONFIGURE_OPTIONS  +=           --with-mpc=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --with-mpfr=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --with-gmp=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --with-ppl=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --with-cloog=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --with-gnu-as
CONFIGURE_OPTIONS  +=           --with-as=$(ECPREFIX)/bin/as
CONFIGURE_OPTIONS  +=           --with-ld=/usr/ccs/bin/ld
CONFIGURE_OPTIONS  +=           --enable-stage1-languages=c
#CONFIGURE_OPTIONS  +=           --enable-languages=c,c++,objc,fortran
CONFIGURE_OPTIONS  +=           --enable-languages=c,c++
CONFIGURE_OPTIONS  +=           --with-stage1-ldflags=-R$(ECPREFIX)/lib
CONFIGURE_OPTIONS  +=           --with-boot-ldflags=-R$(ECPREFIX)/lib

COMPONENT_POST_INSTALL_ACTION = \
        ( strip $(PROTO_DIR)/$(ECPREFIX)/bin/* \
                $(PROTO_DIR)/$(ECPREFIX)/lib/*so* \
                $(PROTO_DIR)/$(ECPREFIX)/lib/*/*so* \
                $(PROTO_DIR)/$(ECPREFIX)/libexec/gcc/*/*/* \
                $(PROTO_DIR)/$(ECPREFIX)/libexec/gcc/*/*/*/* \
                >/dev/null 2>&1; true )

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

test32:		$(BUILD_32)
	(cd $(BUILD_DIR_32); env - $(GMAKE) check)

test:	test32

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

