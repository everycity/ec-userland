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

COMPONENT_NAME=		ORBit2
COMPONENT_FMRI=         developer/orbit2
COMPONENT_VERSION=      2.14.19
COMPONENT_LICENSE=      GPL LGPL
COMPONENT_PROJECT_URL=  https://projects.gnome.org/ORBit2/
COMPONENT_SUMMARY=	ORBit2 is a CORBA 2.4-compliant Object Request Broker (ORB) 
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:5724ed85c626ce406156d2f7c4d104d670eb82cf78e582c325e713a31632c9bd
COMPONENT_ARCHIVE_URL=	ftp://ftp.gnome.org/pub/gnome/sources/ORBit2/2.14/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

