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
# Copyright 2017, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		rsync
COMPONENT_FMRI=		network/rsync
COMPONENT_VERSION=	3.1.2
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://rsync.samba.org/"
COMPONENT_SUMMARY=	rsync - faster, flexible replacement for rcp
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ecfa62a7fa3c4c18b9eccd8c16eaddee4bd308a76ea50b5c02a5840f09c0a1c2
COMPONENT_ARCHIVE_URL=	http://rsync.samba.org/ftp/rsync/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

include ../../make-rules/shared-targets.mk

install:	$(INSTALL_32_and_64)
	cp source/$(COMPONENT_SRC)/rsync.1 $(PROTO_DIR)$(ECPREFIX)/share/man/man1
	cp source/$(COMPONENT_SRC)/rsyncd.conf.5 $(PROTO_DIR)$(ECPREFIX)/share/man/man5

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

include ../../make-rules/depend.mk
