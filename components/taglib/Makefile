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

COMPONENT_NAME=		taglib
COMPONENT_FMRI=	 	multimedia/taglib
COMPONENT_VERSION=      1.9.1
COMPONENT_LICENSE=      LGPLv2.1 MPL
COMPONENT_PROJECT_URL=  http://taglib.github.io/
COMPONENT_SUMMARY=	TagLib is a library for reading and editing the meta-data of several popular audio formats
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a
COMPONENT_ARCHIVE_URL=	http://taglib.github.io/releases/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

CONFIGURE_ENV.64 += PATH=$(ECPREFIX)/bin/$(MACH64):$(PATH)

CMAKE_OPTIONS+=	-DCMAKE_RELEASE_TYPE=Release
CMAKE_OPTIONS+=	-DCMAKE_INSTALL_PREFIX=$(ECPREFIX)
CMAKE_OPTIONS+=	-DINSTALL_BINDIR=$(CONFIGURE_BINDIR.$(BITS))
CMAKE_OPTIONS+=	-DINSTALL_LIBDIR=$(CONFIGURE_LIBDIR.$(BITS))

CMAKE= cmake

CMAKE_OPTIONS+=	-DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_SKIP_RPATH=YES

$(BUILD_DIR)/%/.configured:     $(SOURCE_DIR)/.prep
	($(RM) -rf $(@D) ; $(MKDIR) $(@D))
	$(COMPONENT_PRE_CONFIGURE_ACTION)
	(cd $(@D) ; $(ENV) $(CONFIGURE_ENV) $(CMAKE) $(CMAKE_OPTIONS) $(SOURCE_DIR))
	$(COMPONENT_POST_CONFIGURE_ACTION)
	$(TOUCH) $@

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

