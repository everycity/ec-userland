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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		readline
COMPONENT_FMRI=		library/readline
COMPONENT_VERSION=	6.3
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html"
COMPONENT_SUMMARY=	The GNU Readline library provides a set of functions that allow users to edit command lines as they are typed in.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS += -I$(USRDIR)/include/ncursesw
LDFLAGS += -ltinfo

CONFIGURE_OPTIONS  +=	--disable-static
CONFIGURE_OPTIONS  +=	--enable-shared
CONFIGURE_OPTIONS  +=	--enable-multibyte
CONFIGURE_OPTIONS  +=	--with-curses

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

