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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		getopt
COMPONENT_VERSION=	1.1.5
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:11893276b94b1629606ab75772143918a5713259950fbf4216288e246f19fbb6
COMPONENT_ARCHIVE_URL=	http://software.frodo.looijaard.name/getopt/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_ARGS+= LDFLAGS="-lintl"
COMPONENT_INSTALL_ARGS+= DESTDIR=$(PROTO_DIR) prefix=$(ECPREFIX) mandir=$(ECPREFIX)/share/man

build:		$(BUILD_32)

install:	$(INSTALL_32)

