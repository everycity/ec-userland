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

COMPONENT_NAME=		libev
COMPONENT_FMRI=         library/libev
COMPONENT_VERSION=      4.25
COMPONENT_LICENSE=      BSD or GPLv2
COMPONENT_LICENSE_FILE=	LICENSE
COMPONENT_PROJECT_URL=  "http://software.schmorp.de/pkg/libev.html"
COMPONENT_SUMMARY=	A full-featured and high-performance event loop
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:78757e1c27778d2f3795251d9fe09715d51ce0422416da4abb34af3929c02589
COMPONENT_ARCHIVE_URL=	http://dist.schmorp.de/$(COMPONENT_NAME)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_ENV +=	ac_cv_header_sys_inotify_h=no
CONFIGURE_OPTIONS +=	--includedir=${USRINCDIR}/ev

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

