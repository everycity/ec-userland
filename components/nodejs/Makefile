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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		node
COMPONENT_FMRI=		runtime/nodejs
COMPONENT_VERSION=	5.10.0
COMPONENT_LICENSE=	BSD-like, MIT, Apache
COMPONENT_PROJECT_URL=	"http://nodejs.org"
COMPONENT_SUMMARY=	Evented I/O for V8 JavaScript.
COMPONENT_SRC=		$(COMPONENT_NAME)-v$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8faeb9af5bde641b6e5dfae32bfa99253df2bccf59cf8a62162760026411762b
COMPONENT_ARCHIVE_URL=	http://nodejs.org/dist/v$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_LICENSE_FILE=	LICENSE

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))
CONFIG_SHELL =	$(USRDIR)/bin/python
CONFIGURE_SCRIPT =	$(@D)/configure
CONFIGURE_OPTIONS =	--prefix=$(USRDIR)

build:		$(BUILD_32)

install:	$(INSTALL_32)

