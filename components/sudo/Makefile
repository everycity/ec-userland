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

COMPONENT_NAME=		sudo
COMPONENT_FMRI=		security/sudo
COMPONENT_VERSION=	1.8.28
IPS_COMPONENT_VERSION=	1.8.28.0
COMPONENT_LICENSE=	SUDO
COMPONENT_PROJECT_URL=	"https://www.sudo.ws/"
COMPONENT_SUMMARY=	Sudo security authentication utility
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:9129fa745a08caff0ce2042d2162b38eb9bf73bf43fcb248ac8b3a750c1f13a1
COMPONENT_ARCHIVE_URL=	https://www.sudo.ws/dist/$(COMPONENT_ARCHIVE)


include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

LDFLAGS+=	-lintl

CONFIGURE_OPTIONS+=	--with-insults
CONFIGURE_OPTIONS+=	--with-hal-insults
CONFIGURE_OPTIONS+=	--with-editor=$(ECPREFIX)/bin/vim
CONFIGURE_OPTIONS+=	--exec-prefix=$(ECPREFIX)
CONFIGURE_OPTIONS+=	--with-rundir=$(ECPREFIX)/var/adm/sudo
CONFIGURE_OPTIONS.32+=	--sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS.64+=	--sbindir=$(ECPREFIX)/bin/$(MACH64)

COMPONENT_PRE_CONFIGURE_ACTION+=	$(CP) -R $(SOURCE_DIR)/* $(@D)/

build:		$(BUILD_32)

install:	$(INSTALL_32)

