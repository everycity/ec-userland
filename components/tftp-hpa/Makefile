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

COMPONENT_NAME=		tftp-hpa
COMPONENT_FMRI=         network/tftp-hpa
COMPONENT_VERSION=      5.2
COMPONENT_LICENSE=      tftp-hpa
COMPONENT_PROJECT_URL=  https://www.kernel.org/pub/software/network/tftp/tftp-hpa/
COMPONENT_SUMMARY=	An enhanced version of the BSD TFTP client and server
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:acc04dde662491e3092565ecf9bde504c47dbb1bb0408366009b138fe7754cab
COMPONENT_ARCHIVE_URL=	$(COMPONENT_PROJECT_URL)$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_SCRIPT        = $(@D)/configure
COMPONENT_PRE_CONFIGURE_ACTION+=        $(CP) -R $(SOURCE_DIR)/* $(@D)/
COMPONENT_INSTALL_ARGS +=       INSTALLROOT=$(PROTO_DIR)

build:		$(BUILD_32)

install:	$(INSTALL_32)

