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

COMPONENT_NAME=		tmux
COMPONENT_FMRI=		terminal/tmux
COMPONENT_VERSION=	1.9a
IPS_COMPONENT_VERSION=	1.9.1
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	$(PROJECT_SOURCEFORGE1)
COMPONENT_SUMMARY=	tmux terminal multiplexer
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c5e3b22b901cf109b20dab54a4a651f0471abd1f79f6039d79b250d21c2733f5
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS += -I$(USRDIR)/include/ncurses
LDFLAGS += -lncurses

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

include ../../make-rules/depend.mk
