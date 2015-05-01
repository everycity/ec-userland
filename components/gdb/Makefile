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

COMPONENT_NAME=		gdb
COMPONENT_FMRI=		developer/debug/gdb
COMPONENT_VERSION=	7.8
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://www.gnu.org/software/gdb/"
COMPONENT_SUMMARY=	GDB, the GNU Project debugger
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	sha256:49c4abe174f79f54e1f9e75210ffb590d9b497d5b5200b5398c0e073a4ecb875
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS += -I/usr/include
CPPFLAGS += -I/usr/include
LDFLAGS += -ltinfo

CONFIGURE_OPTIONS += CPP="$(CC) -E -I$(USRDIR)/include"

CONFIGURE_OPTIONS += --with-system-readline
CONFIGURE_OPTIONS += --with-x=no

COMPONENT_BUILD_ARGS += \
	CPP="$(CC) -E -I$(USRDIR)/include" \
	CFLAGS="$(CFLAGS)" \
	CPPFLAGS="$(CPPFLAGS)" \
	LDFLAGS="$(LDFLAGS)"

COMPONENT_INSTALL_ARGS += \
	CPP="$(CC) -E -I$(USRDIR)/include" \
	CFLAGS="$(CFLAGS)" \
	CPPFLAGS="$(CPPFLAGS)" \
	LDFLAGS="$(LDFLAGS)"

build:		$(BUILD_32)

install:	$(INSTALL_32)

# The illumos gcore is special and best so don't supply one with gdb.
COMPONENT_POST_INSTALL_ACTION+=	( \
	$(RM) $(PROTO_DIR)$(USRDIR)/bin/gcore; \
	$(RM) $(PROTO_DIR)$(USRDIR)/include/ansidecl.h; \
	$(RM) $(PROTO_DIR)$(USRDIR)/include/bfd.h; \
	$(RM) $(PROTO_DIR)$(USRDIR)/include/bfdlink.h; \
	$(RM) $(PROTO_DIR)$(USRDIR)/include/dis-asm.h; \
	$(RM) $(PROTO_DIR)$(USRDIR)/include/symcat.h; \
	$(RM) $(PROTO_DIR)$(USRDIR)/lib/charset.alias; \
	$(RM) -r $(PROTO_DIR)$(USRDIR)/share/info; \
	$(RM) -r $(PROTO_DIR)$(USRDIR)/share/locale; \
	$(RM) $(PROTO_DIR)$(USRDIR)/share/man/man1/gcore.1; )
