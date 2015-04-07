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

COMPONENT_NAME=		oniguruma
COMPONENT_FMRI=		library/oniguruma
COMPONENT_VERSION=	5.9.6
COMPONENT_LICENSE=	BSD
COMPONENT_PROJECT_URL=	"http://www.geocities.jp/kosako3/oniguruma/"
COMPONENT_SUMMARY=	Oniguruma is a regular expressions library
COMPONENT_SRC=		onig-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:d5642010336a6f68b7f2e34b1f1cb14be333e4d95c2ac02b38c162caf44e47a7
COMPONENT_ARCHIVE_URL=	http://www.geocities.jp/kosako3/oniguruma/archive/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

build:          $(BUILD_32_and_64)

install:        $(INSTALL_32_and_64)

