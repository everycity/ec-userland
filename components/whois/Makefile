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

COMPONENT_NAME=		whois
COMPONENT_VERSION=	5.0.11
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)ubuntu3
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION)ubuntu3.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:500bc23d710c22cc08ba63df8dec769ef70a0d1c3e492730eb17081783224ebb
COMPONENT_ARCHIVE_URL=	http://archive.ubuntu.com/ubuntu/pool/main/w/whois/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32)

$(BUILD_DIR)/%/.installed:      $(BUILD_DIR)/%/.built
	$(COMPONENT_PRE_INSTALL_ACTION)
	( cd $(@D) ; mkdir -p $(PROTO_DIR)$(ECPREFIX)/bin ; cp whois $(PROTO_DIR)$(ECPREFIX)/bin/whois )
	$(COMPONENT_POST_INSTALL_ACTION)
	$(TOUCH) $@

install:	$(INSTALL_32)

