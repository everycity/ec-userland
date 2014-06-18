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
# Copyright 2014 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		core-os
COMPONENT_FMRI=		system/core-os
COMPONENT_VERSION=	0.1
COMPONENT_LICENSE=	CDDL
COMPONENT_PROJECT_URL=	https://github.com/everycity/ec-userland
COMPONENT_SUMMARY=	The base operating system files, directories and symlinks for the SNGL Zone Brand

include $(WS_TOP)/make-rules/ips.mk

PKGLINT=/bin/true

download:

prep:

build:

install:
	[ -d $(PROTO_DIR) ] || mkdir -p $(PROTO_DIR)
	$(CLONEY) $(COMPONENT_DIR)/files $(PROTO_DIR)

clean:
	$(RM) -r $(BUILD_DIR) $(PROTO_DIR)


