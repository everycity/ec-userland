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

COMPONENT_NAME=		wkhtmltopdf
COMPONENT_FMRI=		graphics/wkhtmltopdf
COMPONENT_VERSION=	0.12.2.1
COMPONENT_LICENSE=	LGPLv3
COMPONENT_PROJECT_URL=	"http://wkhtmltopdf.org/"
COMPONENT_SUMMARY=	Simple shell utility to convert html to pdf using the webkit rendering engine, and QT
COMPONENT_SRC=		wkhtmltox-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	wkhtmltox-$(COMPONENT_VERSION).tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:acb62fa593c537f028883bc827cbb459ed232611d810be109f3942ec8c5aa5c2
COMPONENT_ARCHIVE_URL=	http://download.gna.org/$(COMPONENT_NAME)/0.12/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_TARGETS+= LDFLAGS="$(LDFLAGS)"

COMPONENT_PRE_BUILD_ACTION+=	( cp -r $(SOURCE_DIR)/* $(@D) ; cd $(@D) ; \
	$(USRDIR)/lib/wkhtmltopdf-qt/bin/qmake )
COMPONENT_INSTALL_ENV+= INSTALL_ROOT=$(PROTO_DIR)$(USRDIR)

build:          $(BUILD_32)

install:        $(INSTALL_32)

