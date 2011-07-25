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
# Copyright 2011 EveryCity Ltd. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		tomcat
COMPONENT_VERSION=	6.0.32
COMPONENT_SRC=		apache-tomcat-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	apache-tomcat-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:c0c87e09dae381873d94ba01cc1fef5c188c5ca0
COMPONENT_ARCHIVE_URL=	http://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-6/v$(COMPONENT_VERSION)/bin/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

build: prep

install: build
	[ -d $(PROTO_DIR) ] || $(MKDIR) $(PROTO_DIR)

clean::
	[ -d $(BUILD_DIR) ] && rm -rf $(BUILD_DIR)
