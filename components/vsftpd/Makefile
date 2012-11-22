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

COMPONENT_NAME=		vsftpd
COMPONENT_VERSION=	3.0.2
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:be46f0e2c5528fe021fafc8dab1ecfea0c1f183063a06977f8537fcd0b195e56
COMPONENT_ARCHIVE_URL=	https://security.appspot.com/downloads/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CFLAGS += -I$(COMPONENT_DIR) -idirafter dummyinc

COMPONENT_BUILD_ENV+= CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" CC=gcc

dirent-fixed.h:
	@sed /^extern\ int.*dirfd\(DIR\ \\*\)\;/d </usr/include/dirent.h >dirent-fixed.h

$(BUILD_32): dirent-fixed.h

build:		$(BUILD_32)

$(BUILD_DIR)/.installed:	build
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/empty
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin
	$(INSTALL) $(BUILD_DIR_32)/vsftpd $(PROTO_DIR)$(ECPREFIX)/bin/vsftpd
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/$(COMPONENT_NAME)
	$(INSTALL) $(BUILD_DIR_32)/vsftpd.conf $(PROTO_DIR)$(ECPREFIX)/etc/$(COMPONENT_NAME)/vsftpd.conf
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/man/man5
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/share/man/man8
	$(INSTALL) $(BUILD_DIR_32)/vsftpd.conf.5 $(PROTO_DIR)$(ECPREFIX)/share/man/man5/vsftpd.conf.5
	$(INSTALL) $(BUILD_DIR_32)/vsftpd.8 $(PROTO_DIR)$(ECPREFIX)/share/man/man8/vsftpd.8
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed

