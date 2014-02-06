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

COMPONENT_NAME=		memconf
COMPONENT_VERSION=	3.0.3

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

download prep::
configure build:

install:
	mkdir -p $(PROTO_DIR)$(ECPREFIX)/bin
	cat $(COMPONENT_DIR)/memconf | \
	    $(GSED) 's%#!/usr/bin/env perl%#!$(PERL)%' > \
	    $(PROTO_DIR)$(ECPREFIX)/bin/memconf
	chmod +x $(PROTO_DIR)$(ECPREFIX)/bin/memconf
