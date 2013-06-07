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


# Download the file manually for now
# VERSION=2.1.4
# curl -L --data "FILE=wackamole-${VERSION}.tar.gz&name=-&company=-&email=user@example.com&Stage=Download" \
#   http://www.backhand.org/wackamole/download/download.cgi -o wackamole-${VERSION}.tar.gz

COMPONENT_NAME=		wackamole
COMPONENT_FMRI=         network/wackamole
COMPONENT_VERSION=      2.1.4
COMPONENT_LICENSE=      CNDS Open Source License
COMPONENT_PROJECT_URL=  http://www.backhand.org/wackamole/
COMPONENT_SUMMARY=	Distributed application toolkit
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:ee22b581bc150eeb358ac1a1e53776121a249383c6a68319c148ea51b4668c73
#COMPONENT_ARCHIVE_URL=	http://www.backhand.org/wackamole/download/download.cgi
COMPONENT_ARCHIVE_URL=	$(EC_ARCHIVE)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D))

build:		$(BUILD_32)

install:	$(INSTALL_32)

