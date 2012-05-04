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

COMPONENT_NAME=		zork-trilogy
COMPONENT_VERSION=	1.0

include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

ZCODE_DIR=	$(PROTO_DIR)/$(ECPREFIX)/share/games/zcode
PROTO_BIN_DIR=	$(PROTO_DIR)/$(ECPREFIX)/bin

$(BUILD_DIR)/%/.built: 
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D) $(ZCODE_DIR) $(PROTO_BIN_DIR)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	$(CP) $(COMPONENT_DIR)/files/obtain-zork.sh $(ZCODE_DIR)/
	$(CP) $(COMPONENT_DIR)/files/zork* $(PROTO_BIN_DIR)/
	$(TOUCH) $@

download:

prep:

build:		$(BUILD_32)

install:	$(INSTALL_32)

clean::
	$(RM) -r $(CLEAN_PATHS)
