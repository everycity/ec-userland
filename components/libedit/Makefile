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

COMPONENT_NAME=		libedit
COMPONENT_FMRI=         library/libedit
COMPONENT_VERSION=      3.1
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  "http://thrysoee.dk/editline/"
COMPONENT_SUMMARY=	CLI editor library providing line editing, history, and tokenization functions, similar to those found in GNU Readline
COMPONENT_SRC=		$(COMPONENT_NAME)-20141029-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_NAME)-20141030-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:9701e16570fb8f7fa407b506986652221b701a9dd61defc05bb7d1c61cdf5a40
COMPONENT_ARCHIVE_URL=	http://thrysoee.dk/editline/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

#CONFIGURE_OPTIONS+=	

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

