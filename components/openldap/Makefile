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
# Copyright 2020 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		openldap
COMPONENT_FMRI=		library/openldap
COMPONENT_VERSION=	2.4.50
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.openldap.org/"
COMPONENT_SUMMARY=	OpenLDAP Software
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha256:5cb57d958bf5c55a678c6a0f06821e0e5504d5a92e6a33240841fbca1db586b8
COMPONENT_ARCHIVE_URL=	ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CFLAGS+=	-D_POSIX_PTHREAD_SEMANTICS
CONFIGURE_ENV+=	LIBS="$(LIBS) -lrt"

CONFIGURE_OPTIONS.32 +=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64 +=	--sbindir=$(ECPREFIX)/bin/$(MACH64)
CONFIGURE_OPTIONS.32 +=	--libexecdir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64 +=	--libexecdir=$(ECPREFIX)/bin/$(MACH64)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

