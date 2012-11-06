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
# Copyright 2012 EveryCity Ltd. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		pcp
COMPONENT_VERSION=	1.10

include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

PCP_DIR=	$(PROTO_DIR)/$(ECPREFIX)/bin/
PCP_FILE=	$(PCP_DIR)/pcp
PCP_URL=	http://www.unix.ms/pcp/pcp.txt

$(BUILD_DIR)/%/.built: 
	$(RM) -r $(@D) $(PROTO_DIR) ; $(MKDIR) -p $(@D) $(PCP_DIR)
	$(TOUCH) $@

$(BUILD_DIR)/%/.installed:	$(BUILD_DIR)/%/.built
	( wget -O $(PCP_FILE) $(PCP_URL) )
	( cp $(COMPONENT_DIR)/files/lsof $(PCP_DIR) )
	$(TOUCH) $@

download:

prep:

build:		$(BUILD_32)

install:	$(INSTALL_32)

clean::
	$(RM) -r $(CLEAN_PATHS)
