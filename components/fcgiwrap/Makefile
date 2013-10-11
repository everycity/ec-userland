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

COMPONENT_NAME=		fcgiwrap
COMPONENT_FMRI=         web/server/fcgiwrap
COMPONENT_VERSION=      1.1.0
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://nginx.localdomain.pl/wiki/FcgiWrap"
COMPONENT_SUMMARY=	fcgiwrap is a simple server for running CGI applications over FastCGI.
COMPONENT_SRC=		gnosek-fcgiwrap-4b2151e
COMPONENT_ARCHIVE=	gnosek-fcgiwrap-1.1.0-3-g4b2151e.tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:8e7e4fb7ceb4b2cf360835e1db0d70c55834148a7fb8534657eb1b5fa02cde9c
COMPONENT_ARCHIVE_URL=	https://github.com/gnosek/fcgiwrap/tarball/4b2151e

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION=	( $(CLONEY) $(SOURCE_DIR) $(@D) ); \
	( cd $(@D) && autoreconf -i );

CONFIGURE_SCRIPT=	$(@D)/configure

COMPONENT_BUILD_ENV+=	CC=${CC}

build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

