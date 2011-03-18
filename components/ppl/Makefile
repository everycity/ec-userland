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

COMPONENT_NAME=		ppl
COMPONENT_VERSION=	0.11.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha1:915f1d8a7def10e540bf2806babf94dccd15852a
COMPONENT_ARCHIVE_URL=	http://www.cs.unipr.it/ppl/Download/ftp/releases/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_CONFIGURE_ENV += LD_LIBRARY_PATH="$(ECPREFIX)/lib"
COMPONENT_BUILD_ENV += LD_LIBRARY_PATH="$(ECPREFIX)/lib"
COMPONENT_INSTALL_ENV += LD_LIBRARY_PATH="$(ECPREFIX)/lib"


CONFIGURE_OPTIONS  +=           --with-gmp-prefix=$(ECPREFIX)
CONFIGURE_OPTIONS  +=           --disable-static

#$(MANIFEST_BASE)-ppl.linted:      PKGLINT = /bin/true

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32)

install:	$(INSTALL_32)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk

