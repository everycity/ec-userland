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
# Copyright 2019 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libedit
COMPONENT_FMRI=         library/libedit
COMPONENT_VERSION=      3.1
COMPONENT_DATE=		20181209
IPS_COMPONENT_VERSION=	$(COMPONENT_VERSION).$(COMPONENT_DATE)
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  "http://thrysoee.dk/editline/"
COMPONENT_SUMMARY=	CLI editor library providing line editing, history, and tokenization functions, similar to those found in GNU Readline
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_DATE)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:2811d70c0b000f2ca91b7cb1a37203134441743c4fcc9c37b0b687f328611064
COMPONENT_ARCHIVE_URL=	http://thrysoee.dk/editline/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

