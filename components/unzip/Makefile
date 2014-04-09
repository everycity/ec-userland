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
# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		unzip
COMPONENT_FMRI=		compress/unzip
COMPONENT_VERSION=	6.0
COMPONENT_LICENSE=	Info-ZIP
COMPONENT_PROJECT_URL=	"http://www.info-zip.org/UnZip.html"
COMPONENT_SUMMARY=	The Info-Zip (unzip) decompression utility
COMPONENT_SRC=		$(COMPONENT_NAME)60
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37
SF_PROJECT_NAME=	infozip
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

# remove the unwanted file.
COMPONENT_PREP_ACTION = $(RM) $(SOURCE_DIR)/crc_i386.S

COMPONENT_BUILD_ENV += \
 "LOCAL_UNZIP=-DUNICODE_SUPPORT -DNO_WORKING_ISPRINT -DUNICODE_WCHAR"

# The Makefile we want is under unix/Makefile
COMPONENT_BUILD_ARGS += -f unix/Makefile
COMPONENT_BUILD_TARGETS += generic CC="$(CC)" LDFLAGS="$(LDFLAGS)"
COMPONENT_INSTALL_ARGS += -f unix/Makefile

# This doesn't respect DESTDIR, so overload BINDIR and MANDIR when we install.
COMPONENT_INSTALL_ARGS += BINDIR=$(PROTO_DIR)$(ECPREFIX)/bin
COMPONENT_INSTALL_ARGS += MANDIR=$(PROTO_DIR)$(ECPREFIX)/share/man/man1

build:		$(BUILD_32)

install:	$(INSTALL_32)

