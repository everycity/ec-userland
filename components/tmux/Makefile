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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tmux
COMPONENT_FMRI=		terminal/tmux
COMPONENT_VERSION=	2.3
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	$(PROJECT_SOURCEFORGE1)
COMPONENT_SUMMARY=	tmux terminal multiplexer
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:55313e132f0f42de7e020bf6323a1939ee02ab79c48634aa07475db41573852b
COMPONENT_ARCHIVE_URL=	https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CPPFLAGS += -I$(USRDIR)/include/ncurses
LDFLAGS += -lncurses

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

include ../../make-rules/depend.mk
