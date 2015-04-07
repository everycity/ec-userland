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
# Copyright 2013 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		apachetop
COMPONENT_FMRI=         diagnostic/apachetop
COMPONENT_VERSION=      0.12.6
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  http://www.webta.org/projects/apachetop
COMPONENT_SUMMARY=	Realtime Apache monitoring tool
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:850062414517055eab2440b788b503d45ebe9b290d4b2e027a5f887ad70f3f29
COMPONENT_ARCHIVE_URL=	http://www.webta.org/apachetop/$(COMPONENT_ARCHIVE)

ifeq ($(SOLARIS_VERSION), 2.10)
PUBLISH_STAMP=
endif

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_LICENSE_FILE=	LICENSE

LIBS+=	-ltinfo

CONFIGURE_OPTIONS+=	CPPFLAGS="$(CPPFLAGS) -I/ec/include/ncurses"
CONFIGURE_OPTIONS+=	LIBS="$(LIBS)"

build_2.10:
	@echo "Not available."
build_2.11:	$(BUILD_32_and_64)
build:		build_$(SOLARIS_VERSION)

install_2.10:
	@echo "Not available."
install_2.11:	$(INSTALL_32_and_64)
install:	install_$(SOLARIS_VERSION)

