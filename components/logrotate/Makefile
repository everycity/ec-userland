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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		logrotate
COMPONENT_VERSION=	3.8.1
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:1df36cee76a9c4c7438f35ca3599a7bdd68a09b5
COMPONENT_ARCHIVE_URL=	https://fedorahosted.org/releases/l/o/logrotate/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

# PATCHES HAVE /ec HARDCODED

COMPONENT_BUILD_ENV += CC=$(CC)
COMPONENT_INSTALL_ENV += PREFIX=$(PROTO_DIR)
COMPONENT_INSTALL_ENV += BASEDIR=$(ECPREFIX)
COMPONENT_INSTALL_ENV += MANDIR=$(ECPREFIX)/share

build:		$(BUILD_32)

install:	$(INSTALL_32)

