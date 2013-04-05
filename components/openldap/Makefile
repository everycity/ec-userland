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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openldap
COMPONENT_VERSION=	2.4.35
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha256:16100374c147df0d82a5c52ca60da5eca1a5ea8b5a187467d40a78e3691e9eeb
COMPONENT_ARCHIVE_URL=	ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_ENV +=    LIBS="$(LIBS) -lrt"

CONFIGURE_OPTIONS.32 +=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64 +=	--sbindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32 +=	--libexecdir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64 +=	--libexecdir=$(ECPREFIX)/bin/$(MACH64)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

