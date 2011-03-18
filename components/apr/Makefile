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

COMPONENT_NAME=		apr
COMPONENT_VERSION=	1.4.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:b3ed66c2e7f67c50ae33b5cd85e9f46a93c6e4f8
COMPONENT_ARCHIVE_URL=	http://mirror.cc.columbia.edu/pub/software/apache/apr/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS.32 += --bindir=$(ECPREFIX)/apr/1.4/bin
CONFIGURE_OPTIONS.64 += --bindir=$(ECPREFIX)/apr/1.4/bin/$(MACH64)
#CONFIGURE_OPTIONS.32 += --sbindir=$(ECPREFIX)/apr/1.4/bin
#CONFIGURE_OPTIONS.64 += --sbindir=$(ECPREFIX)/apr/1.4/bin/$(MACH64)
CONFIGURE_OPTIONS.32 += --libdir=$(ECPREFIX)/apr/1.4/lib
CONFIGURE_OPTIONS.64 += --libdir=$(ECPREFIX)/apr/1.4/lib/$(MACH64)
#CONFIGURE_OPTIONS += --includedir=$(ECPREFIX)/apr/1.4/includedir
#CONFIGURE_OPTIONS.64 += --includedir=$(ECPREFIX)/apr/1.4/includedir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --oldincludedir=$(ECPREFIX)/apr/1.4/oldincludedir
#CONFIGURE_OPTIONS.64 += --oldincludedir=$(ECPREFIX)/apr/1.4/oldincludedir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --datarootdir=$(ECPREFIX)/apr/1.4/datarootdir
#CONFIGURE_OPTIONS.64 += --datarootdir=$(ECPREFIX)/apr/1.4/datarootdir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --datadir=$(ECPREFIX)/apr/1.4/datadir
#CONFIGURE_OPTIONS.64 += --datadir=$(ECPREFIX)/apr/1.4/datadir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --infodir=$(ECPREFIX)/apr/1.4/infodir
#CONFIGURE_OPTIONS.64 += --infodir=$(ECPREFIX)/apr/1.4/infodir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --localedir=$(ECPREFIX)/apr/1.4/localedir
#CONFIGURE_OPTIONS.64 += --localedir=$(ECPREFIX)/apr/1.4/localedir/$(MACH64)
#CONFIGURE_OPTIONS += --mandir=$(ECPREFIX)/share/man
#CONFIGURE_OPTIONS.64 += --mandir=$(ECPREFIX)/apr/1.4/mandir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --docdir=$(ECPREFIX)/apr/1.4/docdir
#CONFIGURE_OPTIONS.64 += --docdir=$(ECPREFIX)/apr/1.4/docdir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --htmldir=$(ECPREFIX)/apr/1.4/htmldir
#CONFIGURE_OPTIONS.64 += --htmldir=$(ECPREFIX)/apr/1.4/htmldir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --dvidir=$(ECPREFIX)/apr/1.4/dvidir
#CONFIGURE_OPTIONS.64 += --dvidir=$(ECPREFIX)/apr/1.4/dvidir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --pdfdir=$(ECPREFIX)/apr/1.4/pdfdir
#CONFIGURE_OPTIONS.64 += --pdfdir=$(ECPREFIX)/apr/1.4/pdfdir/$(MACH64)
#CONFIGURE_OPTIONS.32 += --psdir=$(ECPREFIX)/apr/1.4/psdir
#CONFIGURE_OPTIONS.64 += --psdir=$(ECPREFIX)/apr/1.4/psdir/$(MACH64)

CONFIGURE_OPTIONS.32  +=		--with-installbuilddir=$(ECPREFIX)/apr/1.4/build
CONFIGURE_OPTIONS.64  +=		--with-installbuilddir=$(ECPREFIX)/apr/1.4/build/$(MACH64)

CONFIGURE_OPTIONS  +=		--prefix=/ec/apr/1.4
#CONFIGURE_OPTIONS  +=		--enable-layout=OpenSolaris
CONFIGURE_OPTIONS  +=		--enable-threads
CONFIGURE_OPTIONS  +=		--enable-other-child
CONFIGURE_OPTIONS  +=		--enable-nonportable-atomics
CONFIGURE_OPTIONS  +=		--enable-shared

# common targets
build:		$(BUILD_32_and_64)

include ../../make-rules/shared-targets.mk

install:	$(INSTALL_32_and_64)

#install:	$(PROTOUSRSHAREMAN3DIR) $(INSTALL_32_and_64)
#	$(CP) -f $(COMPONENT_DIR)/man3/*.3 $(PROTOUSRSHAREMAN3DIR)

# build does this always
#test: build
#	@cd $(BUILD_DIR_32); $(MAKE) check
#	@cd $(BUILD_DIR_64); $(MAKE) check

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
