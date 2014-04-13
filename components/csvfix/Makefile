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

COMPONENT_NAME=		csvfix
COMPONENT_FMRI=         text/csvfix
COMPONENT_VERSION=      1.5.2014.4.11
COMPONENT_LICENSE=      MIT
COMPONENT_PROJECT_URL=  "http://code.google.com/p/csvfix"
COMPONENT_SUMMARY=	CSVfix is a command-line tool specifically designed to deal with CSV data
COMPONENT_SRC=		$(COMPONENT_NAME)-44e113575fc4
COMPONENT_ARCHIVE=	44e113575fc48ba8fbea19ba0c037635ae90283f.zip
COMPONENT_ARCHIVE_HASH=	sha256:668dced92bf955641d74e70b0e819cb5e99ec1c23ebd4314c00593864165189f
COMPONENT_ARCHIVE_URL=	http://csvfix.googlecode.com/archive/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

COMPONENT_BUILD_TARGETS=	lin

build:		$(BUILD_32)

$(BUILD_DIR)/.installed:	$(BUILD_32)
	$(MKDIR) $(PROTO_DIR)$(ECPREFIX)/bin
	$(CP) $(BUILD_DIR_32)/csvfix/bin/csvfix $(PROTO_DIR)$(ECPREFIX)/bin
	$(TOUCH) $@

install:	$(BUILD_DIR)/.installed
