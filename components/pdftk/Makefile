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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pdftk
COMPONENT_VERSION=	1.44
COMPONENT_SRC=		ec
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-$(COMPONENT_VERSION)-solaris.tar.bz2
COMPONENT_ARCHIVE_HASH=	sha256:7d8318ccf3e8eb5cfeb0396524f89996112c63bb60c0b4a1a415fcdb7bf4ce51
COMPONENT_ARCHIVE_URL=	http://linux01.everycity.co.uk/~aszeszo/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS += $(BUILD_DIR)

build: prep

install: build
	[ -d $(PROTO_DIR) ] || $(MKDIR) $(PROTO_DIR)
	$(SYMLINK) $(SOURCE_DIR) $(PROTO_DIR)/ec || true

