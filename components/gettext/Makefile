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
# Copyright (c) 2013, Igor Kozhukhov <ikozhukhov@gmail.com>
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		gettext
COMPONENT_FMRI=		text/gnu-gettext
COMPONENT_VERSION=	0.19.8.1
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/gettext/"
COMPONENT_SUMMARY=	GNU gettext
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5e2364de57baa279c1c125c43
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS += -I$(USRDIR)/include/libxml2

CONFIGURE_OPTIONS +=	--enable-shared
CONFIGURE_OPTIONS +=	--without-git
CONFIGURE_OPTIONS +=    --disable-java
CONFIGURE_OPTIONS +=    --disable-native-java
CONFIGURE_OPTIONS +=    --disable-libasprintf
CONFIGURE_OPTIONS +=    --without-emacs
CONFIGURE_OPTIONS +=    --without-cvs
CONFIGURE_OPTIONS +=    --disable-openmp
CONFIGURE_OPTIONS +=    --with-included-gettext
CONFIGURE_OPTIONS +=    --with-included-glib
CONFIGURE_OPTIONS +=    --with-included-libcroco
# Fixes coredump in gnulib-test/test-localename test
CONFIGURE_OPTIONS +=	ac_cv_func_newlocale=no

# Tests should run in a clean environment
COMPONENT_TEST_ENV =	-i
COMPONENT_TEST_ENV +=	PATH=${PATH}

# Strip compilation lines from test output
COMPONENT_TEST_TRANSFORMS += \
	'-e "s|^.*$(CC).*$$|XXX_CC_XXX|g" ' \
	'-e "s|^.*source=.*libtool=no.*$$|XXX_CC_XXX|g" ' \
	'-e "s|^.*DEPDIR=.deps.*$$|XXX_CC_XXX|g" ' \
	'-e "/^XXX_CC_XXX$$/d" '

# common targets
build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test:		$(TEST_32_and_64)
