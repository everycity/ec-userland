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

COMPONENT_NAME=		whois
COMPONENT_VERSION=	5.0.11
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)_$(COMPONENT_VERSION)ubuntu1.tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:2986b3333246b57bc8c3e05599f430c28106580b
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

