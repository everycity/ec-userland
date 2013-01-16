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

# Note, this tarbal came from a tar up of http://stormos.org/gitweb/?p=hal.git;a=summary

COMPONENT_NAME=		illumos-hal
COMPONENT_FMRI=         library/hal
COMPONENT_VERSION=      1.0
COMPONENT_LICENSE=      hal
COMPONENT_PROJECT_URL=  http://www.freedesktop.org/wiki/Software/hal
COMPONENT_SUMMARY=	Freedesktop Hardware Abstraction Layer
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d6b99496c698218a061e0b4c79b911fa2cad8438ed5f254a8c44e32fd270689b
COMPONENT_ARCHIVE_URL=	$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION+= ( cd $(SOURCE_DIR) ; autoreconf -i )

CONFIGURE_OPTIONS+=	--with-usb-ids=/tmp/usb.ids
CONFIGURE_OPTIONS+=	--disable-console-kit
CONFIGURE_OPTIONS+=	--disable-policy-kit
CONFIGURE_OPTIONS+=	--disable-parted

build:		$(BUILD_32)

install:	$(INSTALL_32)

