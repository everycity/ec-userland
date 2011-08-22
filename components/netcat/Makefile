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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		nc
COMPONENT_VERSION=	110
COMPONENT_SRC=		$(COMPONENT_NAME)$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tgz
COMPONENT_ARCHIVE_HASH=	sha1:f8ec3a39796b141b6654d39b7957b863c7f79a95
COMPONENT_ARCHIVE_URL=	"http://downloads.sourceforge.net/project/nc110/unix%20netcat%201.10%20by%20_Hobbit_/%5BUnnamed%20release%5D/$(COMPONENT_ARCHIVE)"


include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

UNPACK_ARGS=	"-r$(COMPONENT_SRC)"	

COMPONENT_BUILD_ARGS=	solaris

# install the built source into a prototype area
$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(MKDIR) $(PROTO_DIR)/$(ECPREFIX)/bin
	$(CP) $(@D)/nc $(PROTO_DIR)/$(ECPREFIX)/bin/
	$(TOUCH) $@

build:		$(BUILD_32)

install:	$(INSTALL_32)

