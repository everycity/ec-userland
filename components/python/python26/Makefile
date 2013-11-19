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
# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
#
include ../../../make-rules/shared-macros.mk

PATH=$(ECPREFIX)/bin:/apps/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin:/usr/sbin

COMPONENT_NAME=		Python
COMPONENT_VERSION=	2.6.9
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha256:7277b1285d8a82f374ef6ebaac85b003266f7939b3f2a24a3af52f9523ac94db
COMPONENT_ARCHIVE_URL=	http://python.org/ftp/python/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../../make-rules/prep.mk
include ../../../make-rules/configure.mk
include ../../../make-rules/ips.mk

# make build isn't thread safe.
override COMPONENT_BUILD_GMAKE_ARGS=

# We patch auto* files, so regenerate headers and configure
COMPONENT_PREP_ACTION = \
	(cd $(@D) ; autoheader ; autoconf)

# This seems horribly wrong, but these defines break the ability to build c99
# compliant modules or with gcc.
COMPONENT_POST_CONFIGURE_ACTION = \
	(cd $(@D) ; \
	 perl -pi -e 's/(^\#define _POSIX_C_SOURCE.*)/\/* $$1 *\//' pyconfig.h ; \
	 perl -pi -e 's/^(\#define _XOPEN_SOURCE.*)/\/* $$1 *\//' pyconfig.h ; \
	 perl -pi -e 's/^(\#define _XOPEN_SOURCE_EXTENDED.*)/\/* $$1 *\//' \
			pyconfig.h)

# we don't want to leak $(CC_BITS) into BASECFLAGS as it causes problems with
# python-config so reset FLAG variables without it.
CC +=	$(CC_BITS)
CFLAGS=		-O3 -I/ec/include
CXXFLAGS=	-I/ec/include
LDFLAGS_32=	-L/ec/lib -R/ec/lib
LDFLAGS_64=	-L/ec/lib/$(MACH64) -R/ec/lib/$(MACH64)
LDFLAGS=	$(LDFLAGS_$(BITS))

C99MODE=
CPPFLAGS +=	-IPython

# so we find the ncurses headers
CPPFLAGS +=	-I$(ECPREFIX)/include/ncurses
# enable large files how they did in JDS
CPPFLAGS +=	-D_LARGEFILE64_SOURCE
# libffi for _ctypes
CPPFLAGS +=	$(shell pkg-config --cflags-only-I libffi)

CCFLAGS +=	-norunpath -compat=5

CONFIGURE_OPTIONS  +=		--infodir=$(CONFIGURE_INFODIR)
CONFIGURE_OPTIONS  +=		--enable-shared
CONFIGURE_OPTIONS  +=		--with-system-ffi
CONFIGURE_OPTIONS  +=		--with-wctype-functions
CONFIGURE_OPTIONS  +=		ac_cv_opt_olimit_ok=no
CONFIGURE_OPTIONS  +=		ac_cv_olimit_ok=no
CONFIGURE_OPTIONS  +=		CPPFLAGS="$(CPPFLAGS)"
CONFIGURE_OPTIONS  +=		CFLAGS="$(CFLAGS)"
CONFIGURE_OPTIONS  +=		CCSHARED="$(CC_PIC)"
CONFIGURE_OPTIONS  +=		CC="$(CC)"
CONFIGURE_OPTIONS  +=		CXX="$(CCC)"
CONFIGURE_OPTIONS  +=		CXXFLAGS="$(CCFLAGS)"
CONFIGURE_OPTIONS  +=		LDFLAGS="$(LDFLAGS)"
CONFIGURE_OPTIONS  +=		DFLAGS="-$(BITS)"
COMPONENT_BUILD_ENV  +=		DFLAGS="-$(BITS)"

# 64 bit shared objects need to go in a 64-bit directory
COMPONENT_INSTALL_ARGS.64 += DESTSHARED=$(CONFIGURE_PREFIX)/lib/python2.6/lib-dynload

# Setup pyconfig.h file to support 32 & 64 bit.
# If the /usr/lib/python2.6/lib2to3/*.pickle files are older than the related
# *.txt files in the same directory, it will rebuild them anytime you try to
# build a Python module.  So here we also touch the pickle files to avoid this.
#
COMPONENT_POST_INSTALL_ACTION= \
            (cd $(PROTO_DIR)$(ECPREFIX) ;  \
             $(MV) include/python2.6/pyconfig.h include/python2.6/pyconfig-$(BITS).h ; \
             $(TOUCH) lib/python2.6/lib2to3/*.pickle)

# common targets
build:		$(BUILD_32_and_64)

$(INSTALL_32):	$(INSTALL_64)

install:	$(INSTALL_32_and_64)

test:	$(TEST_32_and_64)

$(BUILD_DIR)/%/.tested:	$(BUILD_DIR)/%/.built
	(cd $(@D) ; gmake test || exit 0) 

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../../make-rules/depend.mk
