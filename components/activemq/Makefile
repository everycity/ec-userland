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
# Copyright 2011, Andrzej Szeszo
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		activemq
COMPONENT_VERSION=	5.5.1
COMPONENT_SRC=		apache-$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-bin.tar.gz
COMPONENT_ARCHIVE_HASH=	sha1:7ffffac52a529ebfe989de05609f3a8a1383ce8e
COMPONENT_ARCHIVE_URL=	http://mirrors.ukfast.co.uk/sites/ftp.apache.org//activemq/apache-activemq/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)

include ../../make-rules/prep.mk
include ../../make-rules/ips.mk

CLEAN_PATHS +=	$(BUILD_DIR)

build: prep

install: build
	[ -d $(PROTO_DIR)$(ECPREFIX)/var ] || mkdir -p $(PROTO_DIR)$(ECPREFIX)/var
	[ -h $(PROTO_DIR)$(ECPREFIX)/var/activemq ] || ln -s $(SOURCE_DIR) $(PROTO_DIR)$(ECPREFIX)/var/activemq
