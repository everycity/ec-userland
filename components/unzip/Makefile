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
# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		unzip
COMPONENT_VERSION=	6.0
COMPONENT_SRC=		$(COMPONENT_NAME)60
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:abf7de8a4018a983590ed6f5cbd990d4740f8a22
COMPONENT_ARCHIVE_URL=	http://downloads.sourceforge.net/infozip/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk
include ../../make-rules/gnu-ld.mk

# remove the unwanted file.
COMPONENT_PREP_ACTION = $(RM) $(SOURCE_DIR)/crc_i386.S

COMPONENT_BUILD_ENV += \
 "LOCAL_UNZIP=-DUNICODE_SUPPORT -DNO_WORKING_ISPRINT -DUNICODE_WCHAR"

# The Makefile we want is under unix/Makefile
COMPONENT_BUILD_ARGS += -f unix/Makefile
COMPONENT_BUILD_TARGETS += generic CC="$(CC)"
COMPONENT_INSTALL_ARGS += -f unix/Makefile

# This doesn't respect DESTDIR, so overload BINDIR and MANDIR when we install.
COMPONENT_INSTALL_ARGS += BINDIR=$(PROTOUSRBINDIR)
COMPONENT_INSTALL_ARGS += MANDIR=$(PROTOUSRSHAREMAN1DIR)

build:		$(BUILD_32)

install:	$(INSTALL_32)

