#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL)". You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		node
COMPONENT_FMRI=		runtime/nodejs
COMPONENT_VERSION=	0.12.4
COMPONENT_LICENSE=	BSD-like, MIT, Apache
COMPONENT_PROJECT_URL=	"http://nodejs.org"
COMPONENT_SUMMARY=	Evented I/O for V8 JavaScript.
COMPONENT_SRC=		$(COMPONENT_NAME)-v$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:3298d0997613a04ac64343e8316da134d04588132554ae402eb344e3369ec912
COMPONENT_ARCHIVE_URL=	http://nodejs.org/dist/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# Include /usr/sbin for dtrace
PATH=$(ECPREFIX)/bin:/usr/bin:/usr/sfw/bin:/usr/ccs/bin:/usr/sbin

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))
CONFIG_SHELL =	$(ECPREFIX)/bin/python
CONFIGURE_SCRIPT =	$(@D)/configure
CONFIGURE_OPTIONS =	--prefix=$(ECPREFIX)

build:		$(BUILD_32)

install:	$(INSTALL_32)

