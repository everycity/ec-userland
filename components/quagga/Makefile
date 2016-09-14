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
# Copyright 2016 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		quagga
COMPONENT_FMRI=		network/quagga
COMPONENT_VERSION=	1.0.20160315
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.quagga.net/"
COMPONENT_SUMMARY=	Routing software suite
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:21ffb7bad0ef5f130f18dd299d219ea1cb4f5c03d473b6b32c83c340cd853263
COMPONENT_ARCHIVE_URL=	http://download.savannah.gnu.org/releases/quagga/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS += --enable-vtysh
CONFIGURE_OPTIONS += --sysconfdir=$(ECPREFIX)/etc/quagga
CONFIGURE_OPTIONS += --sbindir=$(ECPREFIX)/bin
CONFIGURE_OPTIONS += --enable-exampledir=$(ECPREFIX)/share/doc/quagga
CONFIGURE_OPTIONS += --localstatedir=$(ECPREFIX)/var/run/quagga

build:		$(BUILD_32)

install:	$(INSTALL_32)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/etc/quagga
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/var/run
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/var/svc/method
	$(CP) $(BUILD_DIR_32)/solaris/quagga.init $(PROTO_DIR)$(ECPREFIX)/var/svc/method/quagga
