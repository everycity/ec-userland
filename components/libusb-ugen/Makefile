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
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libusb-ugen
COMPONENT_FMRI=		library/libusbugen
COMPONENT_VERSION=	0.1.8
COMPONENT_LICENSE=	CDDL
COMPONENT_PROJECT_URL=	http://libusb.sf.net/
COMPONENT_SUMMARY=	libusb ugen plugin
SOURCE_DIR=		src

include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

$(BUILD_DIR_32)/.built:	BITS=32
$(BUILD_DIR_64)/.built:	BITS=64
COMPONENT_BUILD_ARGS += BITS=$(BITS)

$(BUILD_DIR_32)/.installed:	BITS=32
$(BUILD_DIR_64)/.installed:	BITS=64
COMPONENT_INSTALL_ARGS += BITS=$(BITS)

download:

clean::
	$(RM) $(SOURCE_DIR)/.prep

$(SOURCE_DIR)/.prep:
	$(TOUCH) $@

prep:	$(SOURCE_DIR)/.prep

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)

