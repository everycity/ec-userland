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
# Copyright 2018 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		stunnel
COMPONENT_FMRI=		security/stunnel
COMPONENT_VERSION=	5.47
IPS_COMPONENT_VERSION=	5.47
COMPONENT_LICENSE=	stunnel
COMPONENT_PROJECT_URL=	https://www.stunnel.org/
COMPONENT_SUMMARY=	The stunnel program is designed to work as an SSL encryption wrapper between remote client and local (inetd-startable) or remote server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:c4e675db996eb92beef885f72a3ed8af3c7603fea6b99d2873198dd6c0021d0b
COMPONENT_ARCHIVE_URL=	https://www.stunnel.org/downloads/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS+=	--with-ssl=$(ECPREFIX)

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

