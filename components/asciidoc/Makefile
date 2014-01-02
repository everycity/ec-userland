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

COMPONENT_NAME=		asciidoc
COMPONENT_FMRI=         text/asciidoc
COMPONENT_VERSION=      8.6.9
COMPONENT_LICENSE=      GPLv2
COMPONENT_PROJECT_URL=  "http://asciidoc.org/"
COMPONENT_SUMMARY=	AsciiDoc is a text document format
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323cab4e1f0
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = ($(CLONEY) $(SOURCE_DIR) $(@D) ; \
	cd $(@D) ; \
	$(GSED) -i -e 's!/usr/bin/env python!$(ECPREFIX)/bin/python2.6!' a2x.py ; \
	$(GSED) -i -e 's!/usr/bin/env python!$(ECPREFIX)/bin/python2.6!' asciidoc.py ; )

build:		$(BUILD_32)

install:	$(INSTALL_32)

