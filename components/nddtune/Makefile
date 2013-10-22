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

COMPONENT_NAME=         nddtune
COMPONENT_FMRI=         network/nddtune
COMPONENT_SUMMARY=      Service for applying ndd tunables
COMPONENT_VERSION=      1.0
COMPONENT_PROJECT_URL=  http://www.everycity.co.uk/
COMPONENT_ARCHIVE_URL=  http://www.everycity.co.uk/
COMPONENT_LICENSE=      CDDL

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

download prep::
configure build:

install:
	$(MKDIR) $(PROTO_DIR)
