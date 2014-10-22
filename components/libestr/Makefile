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

COMPONENT_NAME=		libestr
COMPONENT_FMRI=		library/libestr
COMPONENT_VERSION=	0.1.9
COMPONENT_LICENSE=	LGPLv2.1
COMPONENT_PROJECT_URL=	"http://libestr.adiscon.com/"
COMPONENT_SUMMARY=	String handling library used by rsyslog
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:822c6e2d01eaca1e72201f403a2ca01f3e86410b880e508e5204e3c2694d751a
COMPONENT_ARCHIVE_URL=	http://libestr.adiscon.com/files/download/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

