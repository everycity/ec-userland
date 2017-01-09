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
# Copyright 2017 EveryCity Ltd. All rights reserved.
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME=		docutils
COMPONENT_FMRI=		library/python-2/docutils
COMPONENT_VERSION=	0.13.1
COMPONENT_LICENSE=	Public Domain/BSD/GPLv3/Python
COMPONENT_LICENSE_FILE=	COPYING.txt
COMPONENT_PROJECT_URL=	"http://docutils.sourceforge.net/"
COMPONENT_SUMMARY=	Docutils is an open-source text processing system for processing plaintext documentation into useful formats
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	sha256:718c0f5fb677be0f34b781e04241c4067cbd9327b66bdd8e763201130f5175be
COMPONENT_ARCHIVE_URL=	$(DOWNLOAD_SF)

include ../../../make-rules/prep.mk
include ../../../make-rules/setup.py.mk
include ../../../make-rules/ips.mk

build:		$(BUILD_32_and_64)

$(BUILD_DIR)/.installed:	$(INSTALL_32_and_64)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)
	( for script in rst2html.py rst2html5.py rst2latex.py rst2man.py rst2odt_prepstyles.py rst2odt.py rst2pseudoxml.py rst2s5.py rst2xetex.py rst2xml.py rstpep2html.py ; \
		do $(CP) $(PROTO_DIR)$(ECPREFIX)/bin/$$script $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/$$script && \
		$(GSED) -i'' -e 's@#!/ec/bin/amd64/python2.6@#!/ec/bin/python@' $(PROTO_DIR)$(ECPREFIX)/bin/$$script && \
		$(GSED) -i'' -e 's@#!/ec/bin/amd64/python2.6@#!/ec/bin/amd64/python@' $(PROTO_DIR)$(ECPREFIX)/bin/$(MACH64)/$$script ; done )
	$(TOUCH) $@

install:        $(BUILD_DIR)/.installed
