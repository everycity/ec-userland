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
# Copyright 2014, Igor Kozhukhov <ikozhukhov@gmail.com>.
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
#

include ../../make-rules/shared-macros.mk

#PATH = /usr/gnu/bin:/usr/bin

COMPONENT_NAME=		quilt
COMPONENT_VERSION=	0.60
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_PROJECT_URL=	http://savannah.nongnu.org/projects/quilt/
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:3d72a292e432beb9a73f9d0acfe3a77c9b4d7e42209919bb244e9958c7cfe64b
COMPONENT_ARCHIVE_URL=	http://download.savannah.gnu.org/releases/quilt/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

BITS = 64

COMPONENT_PRE_CONFIGURE_ACTION = \
    ($(CLONEY) $(SOURCE_DIR) $(@D))

COMPONENT_PREP_ACTION = \
    (cd $(@D) ; autoconf )

PATCH_LEVEL=	0

# without this, some make messages end up in the
# generated README and man pages.
COMPONENT_BUILD_ARGS+=	--no-print-directory

# Quilt will need this option until Solaris has GNU getopt.
CONFIGURE_OPTIONS += --without-getopt

CONFIGURE_OPTIONS += --with-cp=$(USRDIR)/bin/cp
CONFIGURE_OPTIONS += --with-date=$(USRDIR)/bin/date
CONFIGURE_OPTIONS += --with-grep=$(USRDIR)/bin/grep
CONFIGURE_OPTIONS += --with-tail=$(USRDIR)/bin/tail
CONFIGURE_OPTIONS += --with-tr=$(USRDIR)/bin/tr
CONFIGURE_OPTIONS += --with-sed=$(USRDIR)/bin/gsed
CONFIGURE_OPTIONS += --with-diff=$(USRDIR)/bin/diff
CONFIGURE_OPTIONS += --with-find=$(USRDIR)/bin/gfind
CONFIGURE_OPTIONS += --with-patch=$(USRDIR)/bin/patch
CONFIGURE_OPTIONS += --with-xargs=$(USRDIR)/bin/xargs
CONFIGURE_OPTIONS += --with-perl=$(USRDIR)/bin/perl
CONFIGURE_OPTIONS += --with-pod2man=$(USRDIR)/bin/pod2man
CONFIGURE_OPTIONS += --with-xgettext=$(USRDIR)/bin/xgettext
CONFIGURE_OPTIONS += --with-msgfmt=$(USRDIR)/bin/msgfmt

COMPONENT_INSTALL_ARGS +=	BUILD_ROOT=$(PROTO_DIR)

CONFIGURE_BINDIR.64 = $(CONFIGURE_BINDIR.32)

# common targets
build:		$(BUILD_64)

install:	$(INSTALL_64)

test:		$(TEST_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
