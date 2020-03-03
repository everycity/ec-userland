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
# Copyright 2020 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ca-bundle
COMPONENT_FMRI=		crypto/ca-bundle
COMPONENT_VERSION=	2020.1.1
COMPONENT_LICENSE=	GPLv2 LGPLv2.1 MPL 1.1
COMPONENT_PROJECT_URL=	https://curl.haxx.se/ca/cacert.pem
COMPONENT_ARCHIVE_URL=	https://curl.haxx.se/ca/cacert.pem
COMPONENT_SUMMARY=	Bundle of CA Root Certificates (From Mozilla)

include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

CABUNDLE_DIR=	$(PROTO_DIR)$(ECPREFIX)/etc/openssl
CABUNDLE_FILE=	$(CABUNDLE_DIR)/cabundle.pem
CABUNDLE_URL=	http://curl.haxx.se/ca/cacert.pem

$(BUILD_DIR)/%/.built: 
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D) $(CABUNDLE_DIR)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	( wget -O $(CABUNDLE_FILE) $(CABUNDLE_URL) )
	$(TOUCH) $@

download:

prep:

build:		$(BUILD_32)

install:	$(INSTALL_32)

clean::
	$(RM) -r $(CLEAN_PATHS)

