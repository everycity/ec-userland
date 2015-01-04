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

COMPONENT_NAME=		fftw
COMPONENT_FMRI=		library/fftw
COMPONENT_VERSION=	3.3.3
COMPONENT_LICENSE=	GPLv2
COMPONENT_PROJECT_URL=	"http://www.fftw.org/"
COMPONENT_SUMMARY=	Discrete Fourier transform library
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5c0731fb5c54a97f3
COMPONENT_ARCHIVE_URL=	http://www.fftw.org/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_OPTIONS += --with-pic --enable-shared --disable-static
CONFIGURE_OPTIONS += --enable-sse2

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)


