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

COMPONENT_NAME=		mg
COMPONENT_FMRI=		editor/mg
COMPONENT_VERSION=	20141127
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://homepage.boetes.org/software/mg/"
COMPONENT_SUMMARY=	Micro GNU/emacs
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:33cccebca1cb129de5f26d74750d5a1654bd461e6ab0785703de9f16c19b0ba6
COMPONENT_ARCHIVE_URL=	http://homepage.boetes.org/software/mg/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

ENV+=	ECPREFIX=$(ECPREFIX)

build:		$(BUILD_32)

install:	$(INSTALL_32)

