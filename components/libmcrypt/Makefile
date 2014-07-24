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
# Copyright 2011, 2013, EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		libmcrypt
COMPONENT_VERSION=	2.5.8
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e
SF_PROJECT_NAME=	mcrypt
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF_PROJECT)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION += \
	( cd $(SOURCE_DIR) ; \
	    rm -f Makefile config.guess config.h config.sub config.status ; \
	    ./buildconf ; \
	    cp -r $(SOURCE_DIR)/* $(@D) )

CONFIGURE_OPTIONS+=	--enable-shared --disable-static --with-pic

include ../../make-rules/shared-targets.mk

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

