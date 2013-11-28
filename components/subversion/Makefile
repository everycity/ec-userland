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
# Copyright 2011-2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		subversion
COMPONENT_VERSION=	1.8.5
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:fd522bf1ecda1c09426ed6c436f0744ab95c31702b0904add089864c73ee7564
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_APACHE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=		-lintl -liconv

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic
CONFIGURE_OPTIONS+=	--disable-mod-activation
CONFIGURE_OPTIONS.32+=	--with-apr=$(ECPREFIX)/bin/apr-1-config
CONFIGURE_OPTIONS.64+=	--with-apr=$(ECPREFIX)/bin/$(MACH64)/apr-1-config
CONFIGURE_OPTIONS.32+=	--with-apr-util=$(ECPREFIX)/bin/apu-1-config
CONFIGURE_OPTIONS.64+=	--with-apr-util=$(ECPREFIX)/bin/$(MACH64)/apu-1-config
CONFIGURE_OPTIONS.32+=	--with-swig=$(ECPREFIX)/bin/swig
CONFIGURE_OPTIONS.64+=	--with-swig=$(ECPREFIX)/bin/$(MACH64)/swig
CONFIGURE_OPTIONS.32+=	--with-apxs=$(ECPREFIX)/bin/apxs
CONFIGURE_OPTIONS.64+=	--with-apxs=$(ECPREFIX)/bin/$(MACH64)/apxs
CONFIGURE_OPTIONS.32+=	--with-apache-libexecdir=$(ECPREFIX)/lib/apache/2.2/modules
CONFIGURE_OPTIONS.64+=	--with-apache-libexecdir=$(ECPREFIX)/lib/apache/2.2/modules/$(MACH64)
CONFIGURE_OPTIONS+=	$(CONFIGURE_OPTIONS.$(BITS))
CONFIGURE_OPTIONS+=	JAVA_HOME="$(ECPREFIX)/java"

COMPONENT_BUILD_ENV+= EXTRA_CPPFLAGS=-D__EXTENSIONS__

COMPONENT_INSTALL_TARGETS.32+=	install-swig-py install-swig-rb
COMPONENT_INSTALL_TARGETS.64+=	install-swig-py
COMPONENT_INSTALL_TARGETS+=	$(COMPONENT_INSTALL_TARGETS.$(BITS))

COMPONENT_PRE_CONFIGURE_ACTION+=	($(CP) -R $(SOURCE_DIR)/* $(@D)/)
CONFIGURE_SCRIPT=	$(@D)/configure

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


