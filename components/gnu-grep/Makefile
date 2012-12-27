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
# Copyright 2011,2012 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		grep
COMPONENT_VERSION=	2.14
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:e70e801d4fbb16e761654a58ae48bf5020621c95c8e35bd864742577685872e1
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-liconv

CONFIGURE_OPTIONS+=	--program-prefix=g

PROGS=		egrep fgrep grep
GNUPROGS=	$(PROGS)
GNUMAN1=	$(PROGS:%=%.1)
SFWPROGS=	$(PROGS:%=g%)

build:		$(BUILD_32)

install:	$(INSTALL_32)

test32:		$(BUILD_32)
	(cd $(BUILD_DIR_32); env - $(GMAKE) check)

test:	test32

