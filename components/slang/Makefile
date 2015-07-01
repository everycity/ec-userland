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
# Copyright (c) 2012, Igor Kozhukhov <ikozhukhov@gmail.com>.  All rights reserved.
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
#

# we need JOBS=1 for this component
COMPONENT_BUILD_GMAKE_ARGS=

#CONFIGURE_DEFAULT_LDFLAGS = no
#CONFIGURE_DEFAULT_CPPFLAGS = no
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		slang
COMPONENT_VERSION=	2.2.4
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
COMPONENT_ARCHIVE_HASH=	\
    sha256:9a8257a9a2a55099af858b13338dc8f3a06dd2069f46f0df2c9c3bb84a01d5db
COMPONENT_ARCHIVE_URL=	ftp://space.mit.edu/pub/davis/slang/v2.2/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL=	http://www.jedsoft.org/slang/
COMPONENT_BUGDB=	utility/slang

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = \
	( $(CLONEY) $(SOURCE_DIR) $(@D) )

COMPONENT_PREP_POST_ACTION = ( cd $(@D) \
	&& libtoolize --copy --force \
	&& aclocal -I .  \
	&& autoheader \
	&& automake -a -c -f \
	&& autoconf )

CONFIGURE_SCRIPT = $(@D)/configure

LDFLAGS += $(CC_BITS)
LDFLAGS += -nodefaultlibs -lc

CONFIGURE_OPTIONS  += --sysconfdir=$(CONFIGURE_SYSCONFDIR)/slsh
CONFIGURE_OPTIONS  += --with-readline=gnu
CONFIGURE_OPTIONS  +=  --with-iconv=$(USRDIR)

# common targets
build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test:		$(TEST_32_and_64)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
