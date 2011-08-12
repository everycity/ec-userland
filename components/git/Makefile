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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		git
COMPONENT_VERSION=	1.7.6
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:c519b0765c419c84b561bb4a2a86526b16d95cde
COMPONENT_ARCHIVE_URL=	http://kernel.org/pub/software/scm/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS+=	--libexecdir=$(ECPREFIX)/lib
CONFIGURE_OPTIONS+=	--with-gitconfig=$(ECPREFIX)/etc/gitconfig
CONFIGURE_OPTIONS+=	--with-gitattributes=$(ECPREFIX)/etc/gitattributes
CONFIGURE_OPTIONS+=	--with-python=$(ECPREFIX)/bin/python2.6
CONFIGURE_OPTIONS+=	--with-editor=vim

COMPONENT_BUILD_ENV+=	PERL_PATH=$(ECPREFIX)/bin/perl

build:		$(BUILD_32)

install:	$(INSTALL_32)
