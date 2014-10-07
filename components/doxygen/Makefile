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

COMPONENT_NAME=		doxygen
COMPONENT_FMRI=         developer/documentation/doxygen
COMPONENT_VERSION=      1.8.8
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  http://www.doxygen.org
COMPONENT_SUMMARY=	Doxygen is the de facto standard tool for generating documentation from annotated C++ sources, but it also supports other popular programming languages
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).src.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:158e7834f05e0aeea5794b23c1e775ddfebafc709543e47f6fff9d81b190ade1
COMPONENT_ARCHIVE_URL=	http://ftp.stack.nl/pub/users/dimitri/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION=    $(CLONEY) $(SOURCE_DIR) $(@D)

CONFIGURE_OPTIONS=	--shared --release --prefix=$(USRDIR) --install=$(USRDIR)/bin/install

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

