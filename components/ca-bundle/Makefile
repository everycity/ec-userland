#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2011 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ca-bundle
COMPONENT_VERSION=	2011.5.2
#COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
#COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.bz2
#COMPONENT_ARCHIVE_HASH=	sha1:9cc59be07932b63e1f7d714c56ffaaa92af55373
#COMPONENT_ARCHIVE_URL=	http://curl.haxx.se/download/$(COMPONENT_ARCHIVE)

#include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CABUNDLE_DIR=	$(PROTO_DIR)/$(ECPREFIX)/etc/openssl
CABUNDLE_FILE=	$(CABUNDLE_DIR)/cabundle.pem
CABUNDLE_URL=	http://curl.haxx.se/ca/cacert.pem

$(BUILD_DIR)/%/.built: 
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D) $(CABUNDLE_DIR)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	( $(WS_TOOLS)/userland-fetch --file $(CABUNDLE_FILE) --url $(CABUNDLE_URL) )
	$(TOUCH) $@

download:

prep:

build:		$(BUILD_32)

install:	$(INSTALL_32)

