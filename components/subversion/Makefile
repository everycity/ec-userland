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
# Copyright 2011 Audioboo Ltd. All rights reserved.
# Copyright 2014 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		subversion
COMPONENT_VERSION=	1.8.10
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:1cc900c8a7974337c3ed389dc6b5c59012ec48c7d4107ae31fd7c929ded47dcc
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#LDFLAGS+=		-liconv

CONFIGURE_ENV += PYTHON="$(PYTHON)"
CONFIGURE_ENV += PYMODS="$(PYMODS)"
CONFIGURE_ENV += PYTHONPATH="$(PYTHON_VENDOR_PACKAGES)"

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--disable-mod-activation
CONFIGURE_OPTIONS.32+=	--with-apr=$(USRDIR)/bin/apr-1-config
CONFIGURE_OPTIONS.64+=	--with-apr=$(USRDIR)/bin/$(MACH64)/apr-1-config
CONFIGURE_OPTIONS.32+=	--with-apr-util=$(USRDIR)/bin/apu-1-config
CONFIGURE_OPTIONS.64+=	--with-apr-util=$(USRDIR)/bin/$(MACH64)/apu-1-config
CONFIGURE_OPTIONS.32+=	--with-swig=$(USRDIR)/bin/swig
CONFIGURE_OPTIONS.64+=	--with-swig=$(USRDIR)/bin/$(MACH64)/swig
CONFIGURE_OPTIONS.32+=	--with-apxs=$(USRDIR)/bin/apxs
CONFIGURE_OPTIONS.64+=	--with-apxs=$(USRDIR)/bin/$(MACH64)/apxs
CONFIGURE_OPTIONS.32+=	--with-apache-libexecdir=$(USRDIR)/lib/apache/2.2/modules
CONFIGURE_OPTIONS.64+=	--with-apache-libexecdir=$(USRDIR)/lib/apache/2.2/modules/$(MACH64)
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))
CONFIGURE_OPTIONS+=	JAVA_HOME="$(USRDIR)/java"

COMPONENT_BUILD_ENV+= EXTRA_CPPFLAGS=-D__EXTENSIONS__

COMPONENT_BUILD_ARGS += \
	swig_pydir="$(PYTHON_VENDOR_PACKAGES)" swig_pydir_extra="$(PYTHON_VENDOR_PACKAGES)"

COMPONENT_INSTALL_ARGS += \
	swig_pydir="$(PYTHON_VENDOR_PACKAGES)" swig_pydir_extra="$(PYTHON_VENDOR_PACKAGES)"

COMPONENT_INSTALL_TARGETS.32+=	install-swig-py install-swig-rb
COMPONENT_INSTALL_TARGETS.64+=	install-swig-py
COMPONENT_INSTALL_TARGETS+=	$(COMPONENT_INSTALL_TARGETS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	($(CP) -R $(SOURCE_DIR)/* $(@D)/)
CONFIGURE_SCRIPT=	$(@D)/configure

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


