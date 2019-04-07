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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		readline
COMPONENT_FMRI=		library/readline
COMPONENT_VERSION=	8.0
COMPONENT_LICENSE=	GPLv3
COMPONENT_PROJECT_URL=	"http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html"
COMPONENT_SUMMARY=	The GNU Readline library provides a set of functions that allow users to edit command lines as they are typed in.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_GNU_FTP)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS +=	-I$(USRDIR)/include/ncursesw
LDFLAGS +=	-ltinfo

CONFIGURE_OPTIONS +=	--enable-multibyte
CONFIGURE_OPTIONS +=	--with-curses

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

