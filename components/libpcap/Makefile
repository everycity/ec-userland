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
# Copyright 2015 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libpcap
COMPONENT_FMRI=         library/libpcap
COMPONENT_VERSION=      1.7.3
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  http://www.tcpdump.org/
COMPONENT_SUMMARY=	Packet Capture Library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:dd9f85213dc8e948068405b55dd20f8b32e3083e9e0e186f833bd0372e559e2f
COMPONENT_ARCHIVE_URL=	http://www.tcpdump.org/release/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION+=	($(CLONEY) $(SOURCE_DIR) $(@D))
#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

