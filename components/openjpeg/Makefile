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

COMPONENT_NAME=		openjpeg
COMPONENT_FMRI=         library/openjpeg
COMPONENT_VERSION=	1.5.1
COMPONENT_LICENSE=      BSD
COMPONENT_PROJECT_URL=  "http://www.openjpeg.org/"
COMPONENT_SUMMARY=      An open-source JPEG 2000 codec written in C language.
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:6cfb3097a1c8e9550131b17663daf927f42707bc3f84196c1390642e87f3ab8d
COMPONENT_ARCHIVE_URL=	http://openjpeg.googlecode.com/files/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

# make build isn't thread safe.
override COMPONENT_BUILD_GMAKE_ARGS=

LDFLAGS +=	-lnsl -lsocket
CONFIGURE_OPTIONS +=	--enable-mj2 --enable-jpwl --enable-jpip

COMPONENT_POST_INSTALL_ACTION= ( cd $(PROTO_DIR)$(USRDIR)/include ; \
	$(SYMLINK) openjpeg-1.5/openjpeg.h openjpeg.h; )

build:	$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)
